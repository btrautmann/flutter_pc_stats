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
  final double packageTemperature;

  const Cpu({
    required this.name,
    required this.totalLoad,
    required this.packageTemperature,
  });

  @override
  List<Object?> get props => [
        name,
        totalLoad,
        packageTemperature,
      ];
}

class Gpu extends Equatable {
  final String name;
  final double coreLoad;
  final double coreTemperature;

  const Gpu({
    required this.name,
    required this.coreLoad,
    required this.coreTemperature,
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

    final cpuTotalLoad = cpuEntry.keyForValue('CPU Total-Load');
    final cpuPackageTemperature = cpuEntry.keyForValue('CPU Package-Temperature');
    final map = cpuEntry.value as Map<String, dynamic>;

    final cpu = Cpu(
      name: cpuEntry.key,
      totalLoad: double.parse(map[cpuTotalLoad]),
      packageTemperature: double.parse(map[cpuPackageTemperature]),
    );

    final List<Gpu?> gpus = gpuEntries.map((gpuEntry) {
      final totalLoad = gpuEntry.keyForValue('GPU Core-Load');
      final coreTemperature = gpuEntry.keyForValue('GPU Core-Temperature');
      final map = gpuEntry.value as Map<String, dynamic>;
      return totalLoad == null || coreTemperature == null
          ? null
          : Gpu(
              name: gpuEntry.key,
              coreLoad: double.parse(map[totalLoad]),
              coreTemperature: double.parse(map[coreTemperature]),
            );
    }).toList();

    return HardwareSummary.available(
      cpu: cpu,
      gpus: gpus.whereNotNull().toList(),
    );
  }
}

extension on MapEntry<String, dynamic> {
  String? keyForValue(String v) {
    final map = value as Map<String, dynamic>;
    return map.keys.singleWhereOrNull((key) => key.contains(v));
  }
}
