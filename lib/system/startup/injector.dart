import 'package:flutter/widgets.dart';
import 'package:stars/system/startup/graph.dart';

@immutable
class InjectorWidget extends InheritedWidget {
  const InjectorWidget({
    required super.child,
    required this.graph,
    super.key,
  });

  static Graph of(final BuildContext context) {
    final injector =
        context.dependOnInheritedWidgetOfExactType<InjectorWidget>();

    if (injector != null) {
      return injector.graph;
    }

    throw FlutterError.fromParts(
      <DiagnosticsNode>[
        ErrorSummary(
          'InjectorWidget.of() called with a context that '
          'does not contain a InjectorWidget.',
        ),
        ErrorDescription(
          'No InjectorWidget ancestor could be found starting from the context '
          'that was passed to InjectorWidget.of(). '
          'This usually happens when the context provided is from the same '
          'StatefulWidget as that whose build function actually creates '
          'the InjectorWidget widget being sought.',
        ),
        context.describeElement('The context used was'),
      ],
    );
  }

  final Graph graph;

  @override
  bool updateShouldNotify(final InjectorWidget oldWidget) => false;
}
