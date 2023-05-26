import 'dart:async';
import 'dart:developer';

import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/modules/base.dart';
import 'package:stars/utils/environment.dart';
import 'package:stars/utils/platform/platform.dart';

class Initializer {
  const Initializer(
    this.modules, [
    this.hostPlatform = const SystemPlatform(),
  ]);

  final List<Module<dynamic>> modules;
  final HostPlatform hostPlatform;

  Future<Graph> initialise([
    Environment environment = Environment.production,
  ]) async {
    log('Initializing...\n');
    log('\tas $hostPlatform\n');
    log('\twith environment $environment\n');

    try {
      final graph = await _init(environment);

      log('\nInitializing... Done');

      return graph;
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      log('Unable to create the graph\n$s', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<Graph> _init([
    Environment environment = Environment.production,
  ]) async {
    final builder = GraphBuilder()
      ..hostPlatform = hostPlatform
      ..environment = environment
      ..arguments = <String, dynamic>{};

    await _doInit(hostPlatform, builder);

    return builder.build();
  }

  Future<void> _doInit(
    HostPlatform hostPlatform,
    GraphBuilder builder,
  ) async {
    final summaries = <Summary<dynamic>>[];
    for (final m in modules) {
      summaries.add(await m.initialize(hostPlatform, builder));
    }

    _reportSummary(summaries);
  }

  void _reportSummary(List<Summary<dynamic>> summaryList) {
    final overallDuration = summaryList
        .map((e) => e.duration)
        .fold(Duration.zero, (Duration p, n) => p + n);

    log(
      'Building the graph took: $overallDuration '
      'for ${summaryList.length} modules.',
    );
  }
}
