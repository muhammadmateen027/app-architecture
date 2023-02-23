import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stars/api/api.dart';
import 'package:stars/redux/actions.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/spacex/redux/actions.dart';
import 'package:stars/spacex/redux/launches_item_converter.dart';
import 'package:stars/system/startup/graph.dart';

Epic<AppState> _fetchLaunchesEpic(final Graph graph) =>
    (final Stream<dynamic> actions, final EpicStore<AppState> store) {
      return actions.whereType<FetchLaunchesAction>().flatMap(
            (final action) => _fetchLaunches(action, graph.api),
          );
    };

Stream<Action> _fetchLaunches(
  final FetchLaunchesAction action,
  final Api api,
) async* {
  try {
    final launchesDto = await api.launches();
    final launches = const LaunchItemConverter().convert(launchesDto.launches);

    yield FetchLaunchesSucceededAction(launches);
    // ignore: avoid_catches_without_on_clauses
  } catch (e, s) {
    yield FetchLaunchesFailedAction(e, s);
  }
}

Epic<AppState> launchesListEpics(final Graph graph) => combineEpics<AppState>([
      _fetchLaunchesEpic(graph),
    ]);
