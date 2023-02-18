import 'package:flutter/material.dart';
import 'package:stars/counter/counter.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/system/startup/graph.dart';

class Application extends StatelessWidget {
  const Application({required this.graph, super.key});

  final Graph graph;

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
      home: const CounterPage(),
    );
  }
}
