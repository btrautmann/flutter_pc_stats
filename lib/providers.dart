import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:pc_stats/hardware_summary.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/json_hub_protocol.dart';

final loggerProvider = Provider<Logger>((ref) {
  return Logger(printer: PrettyPrinter());
});

final hubConnectionProvider = Provider<HubConnection>(
  (ref) {
    final ip = dotenv.env['PC_STATS_IP'];
    final port = dotenv.env['PC_STATS_PORT'];
    final serverUrl = "https://$ip:$port/pcstats";
    final logger = ref.read(loggerProvider);
    logger.d("Creating HubConnection for URL $serverUrl");
    return HubConnectionBuilder()
        .withUrl(serverUrl, options: HttpConnectionOptions(requestTimeout: 5000))
        .withHubProtocol(JsonHubProtocol())
        .build();
  },
);

class ServerConnectionNotifier extends StateNotifier<ServerConnection> {
  final HubConnection _connection;
  final Logger _logger;
  ServerConnectionNotifier({
    required HubConnection connection,
    required Logger logger,
  })  : _connection = connection,
        _logger = logger,
        super(ServerConnection.disconnected()) {
    unawaited(listen());
  }

  Future<void> listen() async {
    _connection.onclose(({error}) {
      _logger.e('Connection closed: $error');
      state = ServerConnection.disconnected();
    });

    if (_connection.state != HubConnectionState.Connecting && _connection.state != HubConnectionState.Connected) {
      try {
        await _connection.start();
      } on Exception catch (e) {
        _logger.e('Failed to connect to server: $e');
        await Future.delayed(const Duration(seconds: 3), listen);
      }
      _logger.i('Connection start complete. State=${_connection.state}');
      if (_connection.state == HubConnectionState.Connected) {
        state = ServerConnection.connected(_connection);
      }
    }
  }
}

final serverConnectionNotifierProvider = StateNotifierProvider<ServerConnectionNotifier, ServerConnection>((ref) {
  return ServerConnectionNotifier(
    connection: ref.watch(hubConnectionProvider),
    logger: ref.watch(loggerProvider),
  );
});

class HardwareSummaryNotifier extends StateNotifier<HardwareSummary> {
  final ServerConnection _connection;
  final Logger _logger;

  HardwareSummaryNotifier({
    required ServerConnection connection,
    required Logger logger,
  })  : _connection = connection,
        _logger = logger,
        super(HardwareSummary.unavailable()) {
    unawaited(start());
  }

  Future<void> start() async {
    _connection.when(
      connected: (hub) {
        hub.on("ReceiveSummary", (args) {
          final summary = (args as List<Object?>).single;
          final json = summary as Map<String, dynamic>;
          _logger.d('Received summary:\n$json');
          state = json.toHardwareSummary();
        });
        Timer.periodic(const Duration(seconds: 3), (_) async {
          _logger.d('Polling for hardware summary');
          if (hub.state == HubConnectionState.Connected) {
            await hub.invoke("SendMessage", args: ["Hardware poll"]);
          }
        });
      },
      disconnected: () => state = HardwareSummary.unavailable(),
    );
  }
}

final hardwareSummaryNotifierProvider = StateNotifierProvider<HardwareSummaryNotifier, HardwareSummary>((ref) {
  return HardwareSummaryNotifier(
    connection: ref.watch(serverConnectionNotifierProvider),
    logger: ref.watch(loggerProvider),
  );
});
