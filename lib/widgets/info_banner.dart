import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helper_options/helper_options.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    required this.child,
    this.label = '',
    super.key,
  });

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    var result = child;
    if (label.isNotEmpty) {
      result = Banner(
        message: label.toUpperCase(),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
        location: BannerLocation.topEnd,
        color: context.theme.primaryColor,
        child: result,
      );
    }

    return result;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsNode.message('info_banner'));
  }
}
