import 'package:stars/data_state.dart';
import 'package:stars/spacex/redux/actions.dart';
import 'package:stars/spacex/redux/state.dart';

SpaceXLaunchesState spaceXReducer(
  final SpaceXLaunchesState state,
  final dynamic action,
) {
  if (action is FetchLaunchesSucceededAction) {
    return state.copyWith(
      launches: action.launches,
      launchesState: const DataState.full(),
    );
  } else if (action is FetchLaunchesFailedAction) {
    return state.copyWith(
      launchesState: DataState.error(action.exception),
    );
  }

  return state;
}
