import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stars/redux/actions.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/startup/graph.dart';

import 'package:stars/system/theme/actions.dart';

Epic<AppState> _switchAppThemeEpic(final Graph graph) =>
    (final Stream<dynamic> actions, final EpicStore<AppState> store) {
      return actions
          .whereType<SwitchThemeAction>()
          .flatMap((final action) => _switchTheme(action.themeMode));
    };

Stream<Action> _switchTheme(AppThemeMode themeMode) async* {
  try {
    yield SwitchThemeSucceededAction(themeMode);
    // ignore: avoid_catches_without_on_clauses
  } catch (e, s) {
    yield SwitchThemeFailedAction(e, s);
  }
}

Epic<AppState> appThemeListEpics(final Graph graph) => combineEpics<AppState>([
      _switchAppThemeEpic(graph),
    ]);
