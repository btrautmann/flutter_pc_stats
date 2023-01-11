import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pc_stats/hardware_summary.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/json_hub_protocol.dart';

final hubConnectionProvider = Provider<HubConnection>(
  (ref) {
    // TODO(brandon): Pull this from an Environment Variable
    const serverUrl = 'https://localhost:7188/pcstats';
    return HubConnectionBuilder()
        .withUrl(serverUrl, options: HttpConnectionOptions(requestTimeout: 5000))
        .withHubProtocol(JsonHubProtocol())
        .build();
  },
);

class ServerConnectionNotifier extends StateNotifier<ServerConnection> {
  final HubConnection _connection;
  ServerConnectionNotifier(this._connection) : super(ServerConnection.disconnected()) {
    unawaited(listen());
  }

  Future<void> listen() async {
    _connection.onclose(({error}) {
      print('Connection closed: $error');
      state = ServerConnection.disconnected();
    });

    if (_connection.state != HubConnectionState.Connecting && _connection.state != HubConnectionState.Connected) {
      await _connection.start();
      print('Connection start complete. State=${_connection.state}');
      if (_connection.state == HubConnectionState.Connected) {
        state = ServerConnection.connected(_connection);
      }
    }
  }
}

final serverConnectionNotifierProvider = StateNotifierProvider<ServerConnectionNotifier, ServerConnection>((ref) {
  final hubConnection = ref.watch(hubConnectionProvider);
  return ServerConnectionNotifier(hubConnection);
});

class HardwareSummaryNotifier extends StateNotifier<HardwareSummary> {
  final ServerConnection _connection;

  HardwareSummaryNotifier(this._connection) : super(HardwareSummary.unavailable()) {
    unawaited(start());
  }

  Future<void> start() async {
    _connection.when(
      connected: (hub) {
        hub.on("ReceiveSummary", (args) {
          final summary = (args as List<Object?>).single;
          final json = summary as Map<String, dynamic>;
          print('Received summary:\n$json');
          state = json.toHardwareSummary();
        });
        Timer.periodic(const Duration(seconds: 1), (_) async {
          print('Polling for hardware summary');
          // Every 10 seconds, poll for hardware information
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
  final serverConnection = ref.watch(serverConnectionNotifierProvider);
  return HardwareSummaryNotifier(serverConnection);
});
