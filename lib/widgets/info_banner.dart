import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helper_options/helper_options.dart';
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
    return OptionWidget<String>(
      option: Option.of(label),
      empty: child,
      builder: (_, __) {
        return Banner(
          key: const Key('custom_app_banner'),
          message: label.toUpperCase(),
          textStyle: const TextStyle(color: Colors.black),
          textDirection: TextDirection.ltr,
          location: BannerLocation.topStart,
          color: context.backgroundColor,
          child: child,
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
