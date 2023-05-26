import 'dart:async';
import 'dart:developer';

import 'package:stars/system/startup/graph.dart';
import 'package:stars/utils/platform/platform.dart';

abstract class Module<T> {
  const Module();

  Future<Summary<T>> initialize(
    HostPlatform platform,
    GraphBuilder builder,
  ) async {
    try {
      log('---- $T...');

      final stopwatch = Stopwatch()..start();
      final value = await doInitialize(platform, builder);
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

  void _drawGraph(Stopwatch stopwatch) {
    final buffer = StringBuffer();

    for (var i = 0; i < stopwatch.elapsed.inMilliseconds; ++i) {
      buffer.write('*');
    }

    log(buffer.toString());
  }

  Future<T> doInitialize(HostPlatform platform, GraphBuilder builder);

  bool isModuleAvailable(
    HostPlatform hostPlatform,
    List<OperatingPlatform> supportedPlatforms, {
    bool? forceDisable = false,
  }) {
    if (forceDisable ?? false) {
      log(
        '\t\tModule $T is unavailable running on '
        '${hostPlatform.platform} platform.\n',
      );

      return false;
    }

    for (final platform in supportedPlatforms) {
      if (hostPlatform.platform.runtimeType == platform.runtimeType) {
        log(
          '\t\tModule $T is available running on '
          '${hostPlatform.platform} platform.\n',
        );

        return true;
      }
    }

    log(
      '\t\tModule $T is unavailable running on '
      '${hostPlatform.platform} platform.\n',
    );

    return false;
  }

  Future<void> doInject(T value, GraphBuilder builder);
}

class Summary<T> {
  Summary({
    required this.duration,
    required this.value,
  });

  final T value;
  final Duration duration;
}
