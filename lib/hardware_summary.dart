import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:signalr_netcore/hub_connection.dart';

part 'hardware_summary.freezed.dart';

@freezed
class ServerConnection with _$ServerConnection {
  factory ServerConnection.connected(HubConnection connection) = _Connected;
  factory ServerConnection.disconnected() = _Disconnected;
}

@freezed
class HardwareSummary with _$HardwareSummary {
  factory HardwareSummary.unavailable() = _Unavailable;
  factory HardwareSummary.available({required Cpu cpu, required List<Gpu> gpus}) = _Available;
}

class Cpu extends Equatable {
  final String name;
  final double totalLoad;

  const Cpu({
    required this.name,
    required this.totalLoad,
  });

  @override
  List<Object?> get props => [name, totalLoad];
}

class Gpu extends Equatable {
  final String name;
  final double coreLoad;

  const Gpu({
    required this.name,
    required this.coreLoad,
  });

  @override
  List<Object?> get props => [name, coreLoad];
}

extension HardwareSummaryX on Map<String, dynamic> {
  HardwareSummary toHardwareSummary() {
    final cpuEntry = entries.firstWhere((element) {
      return element.value["type"] == "Cpu";
    });

    final gpuEntries = entries.where((element) {
      return (element.value["type"] as String).contains("Gpu");
    }).toList();

    final cpuTotalLoad = (cpuEntry.value as Map<String, dynamic>).keys.singleWhere((key) {
      return key.contains('CPU Total-Load');
    });
    final cpu = Cpu(
      name: cpuEntry.key,
      totalLoad: double.parse((cpuEntry.value as Map<String, dynamic>)[cpuTotalLoad]),
    );

    final List<Gpu?> gpus = gpuEntries.map((entry) {
      final map = entry.value as Map<String, dynamic>;
      final totalLoad = map.keys.singleWhereOrNull((key) => (key).contains('GPU Core-Load'));
      return totalLoad == null ? null : Gpu(name: entry.key, coreLoad: double.parse(map[totalLoad]));
    }).toList();

    return HardwareSummary.available(
      cpu: cpu,
      gpus: gpus.whereNotNull().toList(),
    );
  }
}
