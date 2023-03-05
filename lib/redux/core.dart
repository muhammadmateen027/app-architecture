import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:stars/pages/pages.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/redux/epics.dart';
import 'package:stars/redux/reducer.dart';
import 'package:stars/system/app_lifecycle/reducer.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/initial_actions.dart';
import 'package:stars/system/startup/state.dart';
import 'package:stars/system/theme/reducer.dart';

AppState appReducer(final AppState state, final dynamic action) {
  return AppState(
    startupState: const StartupState.initialState(),
    spaceXLaunchesState: spaceXReducer(state.spaceXLaunchesState, action),
    systemState: systemReducer(state.systemState, action),
    themeState: themeReducer(state.themeState, action),
  );
}

@immutable
class StarXStore {
  const StarXStore({
    required this.store,
    required this.graph,
  });

  factory StarXStore.inject(final Graph graph) {
    return StarXStore(
      graph: graph,
      store: Store<AppState>(
        reducer,
        initialState: _injectState(graph.arguments),
        middleware: [
          EpicMiddleware<AppState>(epics(graph)),
        ],
      ),
    );
  }

  static AppState _injectState(final Map<String, dynamic> arguments) {
    return AppState.initialState();
  }

  final Store<AppState> store;

  final Graph graph;

  Future<void> dispatchInitial() async {
    initialActions.forEach(store.dispatch);
  }
}
