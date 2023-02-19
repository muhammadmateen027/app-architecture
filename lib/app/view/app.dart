import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stars/api/api.dart';
import 'package:stars/app/routes/app_router.gr.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/provider/launch_detail/launch_detail_provider.dart';
import 'package:stars/provider/launches/launches_provider.dart';

class App extends StatelessWidget {
  const App({required this.api, super.key});

  final Api api;

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      builder: (_, routeWidget) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<LaunchesProvider>(
              create: (_) => LaunchesProvider(api)..init(),
            ),
            ChangeNotifierProvider<LaunchDetailProvider>(
              create: (_) => LaunchDetailProvider(api),
            ),
          ],
          child: routeWidget,
        );
      },
    );
  }
}
