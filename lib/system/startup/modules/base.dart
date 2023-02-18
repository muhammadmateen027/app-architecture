import 'dart:async';
import 'dart:developer';
import 'package:stars/system/startup/graph.dart';

abstract class Module<T> {
  const Module();

  Future<Summary<T>> initialize(
    final GraphBuilder builder,
  ) async {
    try {
      log('---- $T...');

      final stopwatch = Stopwatch()..start();
      final value = await doInitialize(builder);
      await doInject(value, builder);
      stopwatch.stop();

      _drawGraph(stopwatch);

      log('\t\tDone in ${stopwatch.elapsed} with $T\n');

      return Summary(
        duration: stopwatch.elapsed,
        value: value,
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      log('---- \t$T... Error: $e');
      rethrow;
    }
  }

  void _drawGraph(final Stopwatch stopwatch) {
    final buffer = StringBuffer();

    for (var i = 0; i < stopwatch.elapsed.inMilliseconds; ++i) {
      buffer.write('*');
    }

    log(buffer.toString());
  }

  Future<T> doInitialize(
    final GraphBuilder builder,
  );

  Future<void> doInject(final T value, final GraphBuilder builder);
}

class Summary<T> {
  Summary({
    required this.duration,
    required this.value,
  });

  final T value;
  final Duration duration;
}
