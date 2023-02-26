import 'package:meta/meta.dart';
import 'package:stars/pages/pages.dart';
import 'package:stars/system/app_lifecycle/state.dart';
import 'package:stars/system/startup/state.dart';

@immutable
class AppState {
  const AppState({
    required this.startupState,
    required this.spaceXLaunchesState,
    required this.systemState,
  });

  factory AppState.initialState() {
    return AppState(
      startupState: const StartupState.initialState(),
      spaceXLaunchesState: SpaceXLaunchesState.initialState(),
      systemState: const SystemState.initialState(),
    );
  }

  final StartupState startupState;
  final SpaceXLaunchesState spaceXLaunchesState;
  final SystemState systemState;

  AppState copyWith({
    final StartupState? startupState,
    final SpaceXLaunchesState? spaceXLaunchesState,
    final SystemState? systemState,
  }) {
    return AppState(
      startupState: startupState ?? this.startupState,
      spaceXLaunchesState: spaceXLaunchesState ?? this.spaceXLaunchesState,
      systemState: systemState ?? this.systemState,
    );
  }
}
