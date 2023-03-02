import 'package:flutter_test/flutter_test.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/app_lifecycle/actions.dart';
import 'package:stars/system/app_lifecycle/epic.dart';
import 'package:stars/system/app_lifecycle/state.dart';
import 'package:stars/system/startup/graph.dart';

import '../../mocktails.dart';
import '../../stream_utils.dart';

void main() {
  late Graph graph;
  late EpicStore<AppState> epicStore;

  setUp(
    () {
      graph = MockGraph();
      final mockStore = MockStore();
      epicStore = EpicStore(mockStore);
    },
  );

  test(
    'emits foreground state if it switched to foreground',
    () async {
      final events = appLifecycleStateEpics(graph)(
        toStream(const StateChangedAction(LifecycleState.foreground)),
        epicStore,
      );

      expect(events, emits(const StateForegroundAction()));
    },
  );
  test(
    'emits background state if it switched to background',
    () async {
      final events = appLifecycleStateEpics(graph)(
        toStream(const StateChangedAction(LifecycleState.background)),
        epicStore,
      );

      expect(events, emits(const StateBackgroundAction()));
    },
  );

  test(
    'emits paused position if it switched to paused',
    () async {
      final events = appLifecycleStateEpics(graph)(
        toStream(const StateChangedAction(LifecycleState.paused)),
        epicStore,
      );

      expect(events, emits(const StatePausedAction()));
    },
  );
}
