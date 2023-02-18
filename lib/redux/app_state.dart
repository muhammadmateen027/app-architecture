import 'package:meta/meta.dart';
import 'package:stars/system/startup/state.dart';

@immutable
class AppState {
  const AppState({
    required this.startupState,
  });

  factory AppState.initialState() {
    return const AppState(
      startupState: StartupState.initialState(),
    );
  }

  AppState copyWith({
    final StartupState? startupState,
  }) {
    return AppState(
      startupState: startupState ?? this.startupState,
    );
  }

  final StartupState startupState;
}
