import 'package:stars/system/app_lifecycle/actions.dart';
import 'package:stars/system/app_lifecycle/state.dart';

SystemState systemReducer(final SystemState state, final dynamic action) {
  if (action is StateChangedAction) {
    return state.copyWith(state: action.state);
  }

  return state;
}
