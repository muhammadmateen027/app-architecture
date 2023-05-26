import 'package:flutter/material.dart';
import 'package:helper_options/helper_options.dart';
import 'package:stars/app/app.dart';
import 'package:stars/bootstrap.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/initializer.dart';
import 'package:stars/system/startup/injector.dart';
import 'package:stars/system/startup/modules/modules.dart';
import 'package:stars/utils/environment.dart';
import 'package:stars/widgets/snapshot_widget_switcher.dart';

void main({
  Environment environment = Environment.testing,
}) {
  bootstrap(
    () {
      return _Application(
        const Initializer(modules).initialise(environment),
      );
    },
  );
}

class _Application extends StatelessWidget {
  const _Application(this.graph);

  final Future<Graph> graph;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Graph>(
      future: graph,
      builder: (_, snapshot) {
        return SnapshotWidgetSwitcher(
          snapshot: snapshot,
          errorChild: _buildErrorScreen('error_child', snapshot.error),
          loadingChild: _buildSplashScreen('loading_child'),
          child: OptionWidget<Graph>(
            key: const Key('primary_child'),
            option: Option.of(snapshot.data),
            builder: (_, value) {
              return InjectorWidget(
                graph: value,
                child: Application(graph: value),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildErrorScreen(String key, [Object? error]) {
    return Directionality(
      key: Key(key),
      textDirection: TextDirection.ltr,
      child: SizedBox.expand(
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.red),
          child: Center(
            child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSplashScreen(String key) {
    return Directionality(
      key: Key(key),
      textDirection: TextDirection.ltr,
      child: const DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
