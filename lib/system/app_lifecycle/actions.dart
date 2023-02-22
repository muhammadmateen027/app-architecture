import 'package:stars/redux/actions.dart';
import 'package:stars/system/app_lifecycle/state.dart';

class StateChangedAction extends Action {
  const StateChangedAction(this.state);

  final LifecycleState state;

  @override
  String toString() => 'StateChangedAction{state: $state}';
}

class StateForegroundAction extends Action {
  const StateForegroundAction();

  @override
  String toString() => 'StateForegroundAction{}';
}

class StateBackgroundAction extends Action {
  const StateBackgroundAction();

  @override
  String toString() => 'StateBackgroundAction{}';
}

class StatePausedAction extends Action {
  const StatePausedAction();

  @override
  String toString() => 'StatePausedAction{}';
}
