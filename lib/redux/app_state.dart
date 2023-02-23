import 'package:meta/meta.dart';
import 'package:stars/spacex/redux/state.dart';
import 'package:stars/system/startup/state.dart';

@immutable
class AppState {
  const AppState({
    required this.startupState,
    required this.spaceXLaunchesState,
  });

  factory AppState.initialState() {
    return AppState(
      startupState: const StartupState.initialState(),
      spaceXLaunchesState: SpaceXLaunchesState.initialState(),
    );
  }

  final StartupState startupState;
  final SpaceXLaunchesState spaceXLaunchesState;

  AppState copyWith({
    final StartupState? startupState,
    final SpaceXLaunchesState? spaceXLaunchesState,
  }) {
    return AppState(
      startupState: startupState ?? this.startupState,
      spaceXLaunchesState: spaceXLaunchesState ?? this.spaceXLaunchesState,
    );
  }
}
