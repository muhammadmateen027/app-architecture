import 'package:stars/system/app_lifecycle/actions.dart';
import 'package:stars/system/app_lifecycle/reducer.dart';
import 'package:stars/system/app_lifecycle/state.dart';
import 'package:test/test.dart';

void main() {
  test(
    'empty state',
    () {
      const state = SystemState.initialState();

      expect(state.state, LifecycleState.foreground);
    },
  );

  test(
    'switch position to background',
    () {
      const oldState = SystemState.initialState();

      final newState = systemReducer(
        oldState,
        const StateChangedAction(LifecycleState.background),
      );

      expect(newState.state, LifecycleState.background);
    },
  );

  test(
    'switch position to foreground',
    () {
      final oldState = const SystemState.initialState().copyWith(
        state: LifecycleState.background,
      );

      final newState = systemReducer(
        oldState,
        const StateChangedAction(LifecycleState.foreground),
      );

      expect(newState.state, LifecycleState.foreground);
    },
  );
}
