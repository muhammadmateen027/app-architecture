import 'package:stars/data_state.dart';
import 'package:stars/spacex/redux/launch_item.dart';

class SpaceXLaunchesState {
  const SpaceXLaunchesState({
    required this.launches,
    required this.launchesState,
  });

  SpaceXLaunchesState.initialState()
      : launches = const {},
        launchesState = const DataState.none();

  final Set<LaunchItem> launches;
  final DataState launchesState;

  SpaceXLaunchesState copyWith({
    final Set<LaunchItem>? launches,
    final DataState? launchesState,
  }) {
    return SpaceXLaunchesState(
      launches: launches ?? this.launches,
      launchesState: launchesState ?? this.launchesState,
    );
  }
}
