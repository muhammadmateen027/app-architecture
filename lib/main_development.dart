import 'package:flutter/material.dart';
import 'package:helper_options/helper_options.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/app/app.dart';
import 'package:stars/bootstrap.dart';
import 'package:stars/navigation/app_router.gr.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/initializer.dart';
import 'package:stars/system/startup/injector.dart';
import 'package:stars/system/startup/modules/modules.dart';
import 'package:stars/widgets/snapshot_widget_switcher.dart';

void main({
  final Environment environment = Environment.production,
}) {
  bootstrap(
    () {
      final appRouter = AppRouter();

      return _Application(
        const Initializer(modules).initialise(environment),
        appRouter,
      );
    },
  );
}

class _Application extends StatelessWidget {
  const _Application(this.graph, this.appRouter);

  final Future<Graph> graph;
  final AppRouter appRouter;

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<Graph>(
      future: graph,
      builder: (final _, final snapshot) {
        return SnapshotWidgetSwitcher(
          snapshot: snapshot,
          errorChild: _buildSplashScreen(
            'error_child',
            snapshot.error,
          ),
          loadingChild: _buildSplashScreen('loading_child'),
          child: OptionWidget<Graph>(
            key: const Key('primary_child'),
            option: Option.of(snapshot.data),
            builder: (final _, final value) {
              return InjectorWidget(
                graph: value,
                child: Application(graph: value, appRouter: appRouter),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildSplashScreen(final String key, [final Object? error]) {
    return Directionality(
      key: Key(key),
      textDirection: TextDirection.ltr,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Text(error.toString()),
      ),
    );
  }
}
