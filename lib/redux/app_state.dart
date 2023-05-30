import 'package:meta/meta.dart';
import 'package:stars/pages/pages.dart';
import 'package:stars/pages/popup/dialog/dialog_state.dart';
import 'package:stars/pages/popup/snack_bar/snack_bar_state.dart';
import 'package:stars/system/app_lifecycle/state.dart';
import 'package:stars/system/startup/state.dart';

@immutable
class AppState {
  const AppState({
    required this.startupState,
    required this.spaceXLaunchesState,
    required this.systemState,
    required this.dialogState,
    required this.snackBarState,
  });

  factory AppState.initialState() {
    return AppState(
      startupState: const StartupState.initialState(),
      spaceXLaunchesState: SpaceXLaunchesState.initialState(),
      systemState: const SystemState.initialState(),
      dialogState: const DialogState.initialState(),
      snackBarState: const SnackBarState.initialState(),
    );
  }

  final StartupState startupState;
  final SpaceXLaunchesState spaceXLaunchesState;
  final SystemState systemState;
  final DialogState dialogState;
  final SnackBarState snackBarState;

  AppState copyWith({
    final StartupState? startupState,
    final SpaceXLaunchesState? spaceXLaunchesState,
    final SystemState? systemState,
    final DialogState? dialogState,
    final SnackBarState? snackBarState,
  }) {
    return AppState(
      startupState: startupState ?? this.startupState,
      spaceXLaunchesState: spaceXLaunchesState ?? this.spaceXLaunchesState,
      systemState: systemState ?? this.systemState,
      dialogState: dialogState ?? this.dialogState,
      snackBarState: snackBarState ?? this.snackBarState,
    );
  }
}
