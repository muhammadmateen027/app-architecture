import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stars/counter/counter.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/system/app_life_cycle/cubit.dart';
import 'package:stars/system/app_life_cycle/state_observer.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/utils/environment.dart';
import 'package:stars/widgets/widgets.dart';

class Application extends StatelessWidget {
  const Application({required this.graph, super.key});

  final Graph graph;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => graph,
      child: BlocProvider(
        create: (blocContext) => AppLifeCycleCubit(),
        child: StateObserver(
          onLifecycleChanged: (status) {
            context.read<AppLifeCycleCubit>().stateChangedAction(status);
          },
          child: const AppBuilder(),
        ),
      ),
    );
  }
}

class AppBuilder extends StatelessWidget {
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (_, child) {
        return InfoBanner(
          label: context.read<Graph>().environment.appTitleSuffix,
          child: Material(
            color: Colors.red, // this could be any colour
            child: SafeArea(
              child: child ?? const SizedBox(),
            ),
          ),
        );
      },
    );
  }
}
