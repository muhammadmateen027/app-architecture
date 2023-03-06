import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stars/extensions/extensions.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    required this.child,
    this.label = '',
    super.key,
  });

  final Widget child;
  final String label;

  @override
  Widget build(final BuildContext context) {
    var result = child;
    if (label.isNotEmpty) {
      result = Banner(
        message: label.toUpperCase(),
        textStyle: const TextStyle(color: Colors.black),
        textDirection: TextDirection.ltr,
        location: BannerLocation.topStart,
        color: context.backgroundColor,
        child: result,
      );
    }
    return result;
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsNode.message('info_banner'));
  }
}
