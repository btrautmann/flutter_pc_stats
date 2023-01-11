import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pc_stats/hardware_summary.dart';
import 'package:pc_stats/provider_logging.dart';
import 'package:pc_stats/providers.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// TODO(brandon): Figure out a better way to do this
// This is required, otherwise we fail to connect to SignalR server
class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (cert, host, port) => true;
  }
}

void main() async {
  HttpOverrides.global = _HttpOverrides();
  FlutterError.onError = (details) {
    print(details.exceptionAsString());
  };
  await dotenv.load();
  runZonedGuarded(
    () => runApp(
      ProviderScope(
        observers: [
          ProviderLogger(),
        ],
        child: const MyApp(),
      ),
    ),
    (error, stack) => print(error),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PC Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'PC Stats'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hardwareSummary = ref.watch(hardwareSummaryNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // ignore: prefer_const_constructors
      body: hardwareSummary.when(
        unavailable: () => const CircularProgressIndicator(),
        available: (cpu, gpus) => _SummaryAvailable(
          cpu: cpu,
          gpus: gpus,
        ),
      ),
    );
  }
}

class _SummaryAvailable extends StatelessWidget {
  final Cpu cpu;
  final List<Gpu> gpus;

  const _SummaryAvailable({
    required this.cpu,
    required this.gpus,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SimpleGauge(
            value: cpu.totalLoad,
            label: cpu.name,
          ),
          ...[
            ...gpus.map(
              (gpu) => _SimpleGauge(
                value: gpu.coreLoad,
                label: gpu.name,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SimpleGauge extends StatelessWidget {
  final double value;
  final String label;

  const _SimpleGauge({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 750,
          axes: [
            RadialAxis(
              axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor,
                thickness: 0.15,
              ),
              pointers: [
                RangePointer(
                  value: value,
                  cornerStyle: CornerStyle.bothCurve,
                  enableAnimation: true,
                  animationDuration: 1200,
                  sizeUnit: GaugeSizeUnit.factor,
                  gradient: const SweepGradient(
                    colors: <Color>[Color(0xFF6A6EF6), Color(0xFFDB82F5)],
                    stops: <double>[0.25, 0.75],
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  width: 0.15,
                ),
              ],
            )
          ],
        ),
        Text(label),
      ],
    );
  }
}
