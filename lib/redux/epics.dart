import 'package:redux_epics/redux_epics.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/spacex/redux/epic.dart';
import 'package:stars/system/startup/graph.dart';

Epic<AppState> epics(final Graph graph) => combineEpics<AppState>([
      launchesListEpics(graph),
    ]);
