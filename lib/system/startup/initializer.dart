import 'dart:async';

import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/modules/base.dart';
import 'package:stars/utils/environment.dart';
import 'package:stars/utils/logger.dart';
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
    logger
      ..i('Initializing...')
      ..s('\tas $hostPlatform')
      ..i('\twith "${environment.toLabel.toUpperCase()}" environment')
      ..d('');

    try {
      final stopwatch = Stopwatch()..start();
      final graph = await _init(environment);

      logger.s('Initializing... Done');

      _drawGraph(stopwatch);
      return graph;
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      logger.e('Unable to create the graph\n$s', error: e, stackTrace: s);
      rethrow;
    }
  }

  void _drawGraph(Stopwatch stopwatch) {
    final buffer = StringBuffer();

    for (var i = 0; i < (stopwatch.elapsed.inMilliseconds / 2); ++i) {
      buffer.write('*');
    }

    logger.s(buffer.toString());
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

    logger
      ..d('')
      ..s(
        'Building the graph took: $overallDuration '
        'for ${summaryList.length} modules.',
      );
  }
}
