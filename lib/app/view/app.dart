import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/app/view/app_builder.dart';
import 'package:stars/navigation/app_router.gr.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/redux/core.dart';
import 'package:stars/system/app_lifecycle/actions.dart';
import 'package:stars/system/app_lifecycle/state.dart';
import 'package:stars/system/app_lifecycle/state_observer.dart';
import 'package:stars/system/startup/graph.dart';

class Application extends StatefulWidget {
  const Application({
    required this.graph,
    required this.appRouter,
    super.key,
  });

  final Graph graph;
  final AppRouter appRouter;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late StarXStore starXStore;

  @override
  void initState() {
    super.initState();
    starXStore = StarXStore.inject(widget.graph)..dispatchInitial();
  }

  @override
  void didUpdateWidget(final Application oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.graph != widget.graph) {
      starXStore = StarXStore.inject(widget.graph)..dispatchInitial();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: starXStore.store,
      child: StoreConnector<AppState, MainViewModel>(
        distinct: true,
        converter: (final store) => MainViewModel.from(
          store,
          widget.graph.environment,
        ),
        builder: (_, vm) {
          return StateObserver(
            onLifecycleChanged: vm.positionChanged,
            child: AppBuilder(appRouter: widget.appRouter),
          );
        },
      ),
    );
  }
}

@immutable
class MainViewModel extends Equatable {
  const MainViewModel._({
    required this.onDispatch,
    required this.environment,
  });

  factory MainViewModel.from(
    final Store<AppState> store,
    final Environment environment,
  ) {
    return MainViewModel._(
      onDispatch: store.dispatch,
      environment: environment,
    );
  }

  final void Function(dynamic) onDispatch;
  final Environment environment;

  void positionChanged(final LifecycleState position) =>
      onDispatch(StateChangedAction(position));

  String applicationTitleSuffix() =>
      environmentLabel.isNotEmpty ? ' - $environmentLabel' : '';

  String get environmentLabel {
    switch (environment) {
      case Environment.staging:
        return 'staging';
      case Environment.stub:
        return 'stub';
      default:
        return '';
    }
  }

  @override
  List<Object?> get props => [environment];
}
