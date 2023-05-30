import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:stars/utils/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    logger.e(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => logger.e(error.toString(), stackTrace: stackTrace),
  );
}
