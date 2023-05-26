import 'package:flutter/material.dart';
import 'package:stars/system/app_life_cycle/cubit.dart';

typedef OnLifecycleStateChanged = void Function(LifecycleState);

class StateObserver extends StatefulWidget {
  const StateObserver({
    required this.child,
    required this.onLifecycleChanged,
    super.key,
  });

  final Widget child;
  final OnLifecycleStateChanged onLifecycleChanged;

  @override
  State<StateObserver> createState() => _StateObserverState();
}

class _StateObserverState extends State<StateObserver>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onLifecycleChanged(LifecycleState.foreground);
        break;
      case AppLifecycleState.paused:
        widget.onLifecycleChanged(LifecycleState.paused);
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        widget.onLifecycleChanged(LifecycleState.background);
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
