import 'package:stars/system/app_lifecycle/state.dart';
import 'package:test/test.dart';

void main() {
  test(
    'initial state is set to foreground',
    () {
      const state = SystemState.initialState();

      expect(state.state, LifecycleState.foreground);
    },
  );

  test(
    'copy method will update state',
    () {
      final state = const SystemState.initialState().copyWith(
        state: LifecycleState.background,
      );

      expect(state.state, LifecycleState.background);
    },
  );

  test(
    'copy method will not update state if parameter not provided',
    () {
      final state = const SystemState.initialState().copyWith();

      expect(state.state, LifecycleState.foreground);
    },
  );
}
