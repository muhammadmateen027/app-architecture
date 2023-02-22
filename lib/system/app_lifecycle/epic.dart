
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/app_lifecycle/actions.dart';
import 'package:stars/system/app_lifecycle/state.dart';
import 'package:stars/system/startup/graph.dart';

Epic<AppState> _stateChangedEpic(final Graph graph) =>
    (final Stream<dynamic> actions, final EpicStore<AppState> store) {
      return actions
          .whereType<StateChangedAction>()
          .flatMap((final action) => _refreshState(action.state));
    };

Stream<dynamic> _refreshState(final LifecycleState state) async* {
  switch (state) {
    case LifecycleState.background:
      yield const StateBackgroundAction();
      break;
    case LifecycleState.paused:
      yield const StatePausedAction();
      break;
    case LifecycleState.foreground:
      yield const StateForegroundAction();
      break;
  }
}

Epic<AppState> appLifecycleStateEpics(final Graph graph) =>
    combineEpics<AppState>([
      _stateChangedEpic(graph),
    ]);
