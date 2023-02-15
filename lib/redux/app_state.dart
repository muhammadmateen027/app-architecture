import 'package:meta/meta.dart';
import 'package:stars/navigation/state.dart';
import 'package:stars/system/startup/state.dart';

@immutable
class AppState {
  const AppState({
    required this.navigationState,
    required this.startupState,
  });

  factory AppState.initialState() {
    return AppState(
      navigationState: NavigationState.initialState(),
      startupState: const StartupState.initialState(),
    );
  }

  AppState copyWith({
    final NavigationState? navigationState,
    final StartupState? startupState,
  }) {
    return AppState(
      navigationState: navigationState ?? this.navigationState,
      startupState: startupState ?? this.startupState,
    );
  }

  final StartupState startupState;
  final NavigationState navigationState;
}
