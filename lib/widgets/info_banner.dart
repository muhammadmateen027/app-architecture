import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helper_options/helper_options.dart';
import 'package:stars/extensions/extensions.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({this.child, this.label = '', super.key});

  final Widget? child;
  final String label;

  @override
  Widget build(final BuildContext context) {
    final result = child ?? const Offstage();
    return OptionWidget<String>(
      option: Option.of(label),
      empty: result,
      builder: (_, __) {
        return Banner(
          message: label.toUpperCase(),
          textStyle: const TextStyle(color: Colors.black),
          textDirection: TextDirection.ltr,
          location: BannerLocation.topStart,
          color: context.backgroundColor,
          child: result,
        );
      },
    );
  }

  @override
  void debugFillProperties(final DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsNode.message('info_banner'));
  }
}
