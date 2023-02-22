import 'package:meta/meta.dart';

@immutable
class SystemState {
  const SystemState({required this.state});

  const SystemState.initialState() : state = LifecycleState.foreground;

  final LifecycleState state;

  SystemState copyWith({final LifecycleState? state}) {
    return SystemState(
      state: state ?? this.state,
    );
  }
}

enum LifecycleState { background, foreground, paused }
