import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/injector.dart';

import 'mocktails.dart';

typedef OnReduction = AppState Function(dynamic);

class WidgetTestbed {
  WidgetTestbed({
    this.graph,
    this.store,
    this.onReduction,
  });

  final Graph? graph;
  final Store<AppState>? store;
  final OnReduction? onReduction;

  late Store<AppState> _trueStore;

  void flushActions() => _trueStore.dispatch(1);

  void dispatch(final dynamic action) {
    _trueStore.dispatch(action);
  }

  Widget simpleWrap({
    final Widget? child,
    final RouteFactory? routeFactory,
    final Brightness brightness = Brightness.light,
  }) {
    return MaterialApp(
      theme: ThemeData(brightness: brightness),
      onGenerateRoute: routeFactory,
      home: child != null ? Material(child: child) : null,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  Widget reduxWrap({
    required final Widget child,
    final RouteFactory? routeFactory,
    final bool autoRoute = true,
  }) {
    _trueStore = Store<AppState>(
      (final AppState state, final dynamic action) {
        return onReduction?.call(action) ?? state;
      },
      initialState: store?.state ?? AppState.initialState(),
    );

    return InjectorWidget(
      graph: graph ?? MockGraph(),
      child: StoreProvider<AppState>(
        store: _trueStore,
        child: autoRoute
            ? simpleWrap(child: child, routeFactory: routeFactory)
            : child,
      ),
    );
  }

  Widget graphWrap({
    required final Widget child,
    final RouteFactory? routeFactory,
    final bool autoRoute = true,
  }) {
    return InjectorWidget(
      graph: graph ?? MockGraph(),
      child: autoRoute
          ? simpleWrap(child: child, routeFactory: routeFactory)
          : child,
    );
  }
}
