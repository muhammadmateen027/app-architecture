import 'package:flutter/widgets.dart';
import 'package:stars/navigation/navigation.dart';

@immutable
class Navi extends InheritedWidget {
  const Navi({
    required super.child,
    required this.router,
    super.key,
  });

  final NavigationRouterDelegate router;

  static NavigationRouterDelegate of(final BuildContext context) {
    final navi = context.dependOnInheritedWidgetOfExactType<Navi>();

    if (navi != null) {
      return navi.router;
    }

    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
        'Navi.of() called with a context that does not contain a Navi.',
      ),
      ErrorDescription(
        'No Navi ancestor could be found starting from the context that was '
        'passed to Navi.of(). This usually happens when the context provided '
        'is from the same StatefulWidget as that whose build function actually '
        'creates the Navi widget being sought.',
      ),
      context.describeElement('The context used was'),
    ]);
  }

  @override
  bool updateShouldNotify(final Navi oldWidget) => false;
}
