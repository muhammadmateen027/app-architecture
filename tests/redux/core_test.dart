import 'package:mocktail/mocktail.dart';
import 'package:redux/redux.dart';
import 'package:stars/pages/spacex/redux/actions.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/redux/core.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:test/test.dart';

import '../mocktails.dart';

void main() {
  late Graph graph;
  late Store<AppState> store;

  setUp(
    () {
      graph = MockGraph();
      store = MockStore();
    },
  );

  test(
    'is created',
    () {
      StarXStore(store: store, graph: graph);
    },
  );

  test(
    'fetch launches on initial dispatch',
    () async {
      final appStore = StarXStore(store: store, graph: graph);

      await appStore.dispatchInitial();

      verify(() => store.dispatch(const FetchLaunchesAction()));
    },
  );
}
