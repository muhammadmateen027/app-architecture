import 'dart:async';

import 'package:stars/api/environment.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/modules/base.dart';
import 'package:stars/utils/logger.dart';

class Initializer {
  const Initializer(this.modules);

  final List<Module<dynamic>> modules;

  Future<Graph> initialise([
    final Environment environment = Environment.production,
  ]) async {
    logger
      ..i('Initializing...\n')
      ..i('\twith environment $environment\n')
      ..d('');

    try {
      final graph = await _init(environment);

      logger.s('\nInitializing... Done');

      return graph;
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      logger.e('Unable to create the graph\n$s', error: e, stackTrace: s);
      rethrow;
    }
  }

  Future<Graph> _init([
    final Environment environment = Environment.production,
  ]) async {
    final builder = GraphBuilder()
      ..environment = environment
      ..arguments = <String, dynamic>{};

    await _doInit(builder);

    return builder.build();
  }

  Future<void> _doInit(
    final GraphBuilder builder,
  ) async {
    final summaries = <Summary<dynamic>>[];
    for (final m in modules) {
      summaries.add(await m.initialize(builder));
    }

    _reportSummary(summaries);
  }

  void _reportSummary(final List<Summary<dynamic>> summaryList) {
    final overallDuration = summaryList
        .map((final e) => e.duration)
        .fold(Duration.zero, (final Duration p, final n) => p + n);

    logger.s(
      'Building the graph took: $overallDuration '
      'for ${summaryList.length} modules.',
    );
  }
}
