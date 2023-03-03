import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

typedef Chain = Future<dynamic> Function();

typedef FutureCallback = Future<void> Function();

mixin Screenshot<T extends BasePage> on BasePage {
  T takeScreenshot([final String? name]) {
    deffer(
      () async {
        if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
          await _tester.takeScreenshot(name ?? '');
        }
      },
    );

    // ignore: avoid_as
    return this as T;
  }
}

class BasePage {
  BasePage(this._tester, [final Future<dynamic>? chained])
      : _future = chained ?? Future.value();

  final WidgetTester _tester;
  Future<dynamic> _future;

  void deffer(final Chain chain) =>
      _future = Future.value(_future.then((final _) => chain()));

  Future<dynamic> execute() => _future;
}

extension WidgetTesterEx on WidgetTester {
  Future<void> takeScreenshot(final String name) async {
    final boundary = firstRenderObject<RenderRepaintBoundary>(
      find.byType(RepaintBoundary),
    );
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    if (byteData != null) {
      final pngBytes = byteData.buffer.asUint8List();

      final file = await File('${Directory.current.path}/screenshots/$name.png')
          .create(recursive: true);
      await file.writeAsBytes(pngBytes);
    }
  }
}
