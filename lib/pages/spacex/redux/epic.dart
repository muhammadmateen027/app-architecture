import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stars/api/api.dart';
import 'package:stars/pages/pages.dart';
import 'package:stars/pages/spacex/redux/launches_item_converter.dart';
import 'package:stars/redux/actions.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/startup/graph.dart';

Epic<AppState> _fetchLaunchesEpic(final Graph graph) =>
    (final Stream<dynamic> actions, final EpicStore<AppState> store) {
      return actions.whereType<FetchLaunchesAction>().flatMap(
            (final action) => _fetchLaunches(graph.api),
          );
    };

Epic<AppState> _refreshLaunchesEpic(final Graph graph) =>
    (final Stream<dynamic> actions, final EpicStore<AppState> store) {
      return actions.whereType<RefreshLaunchesAction>().flatMap(
            (final action) => _fetchLaunches(graph.api),
          );
    };

Stream<Action> _fetchLaunches(final Api api) async* {
  try {
    final launchesDto = await api.launches();
    final launches = const LaunchItemConverter().convert(launchesDto);

    yield FetchLaunchesSucceededAction(launches);
    // ignore: avoid_catches_without_on_clauses
  } catch (e, s) {
    yield FetchLaunchesFailedAction(e, s);
  }
}

Epic<AppState> launchesListEpics(final Graph graph) => combineEpics<AppState>([
      _fetchLaunchesEpic(graph),
      _refreshLaunchesEpic(graph),
    ]);
