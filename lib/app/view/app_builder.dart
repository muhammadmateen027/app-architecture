import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/navigation/app_router.gr.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/theme/actions.dart';

import '../../api/environment.dart';
import '../../widgets/info_banner.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({
    required this.appRouter,
    required this.environment,
    super.key,
  });

  final AppRouter appRouter;
  final Environment environment;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (final store) => _ViewModel.from(store, environment),
      builder: (_, viewModel) {
        return MaterialApp.router(
          title: 'StarXSpace${viewModel.applicationTitleSuffix}',
          theme: viewModel.appTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          builder: (final context, final child) {
            return InfoBanner(
              label: viewModel.environment.debugLabel,
              child: child ?? const Offstage(),
            );
          },
        );
      },
    );
  }
}

@immutable
class _ViewModel extends Equatable {
  const _ViewModel._({
    required this.onDispatch,
    required this.themeMode,
    required this.environment,
  });

  factory _ViewModel.from(
    final Store<AppState> store,
    final Environment environment,
  ) {
    return _ViewModel._(
      onDispatch: store.dispatch,
      themeMode: store.state.themeState.themeMode,
      environment: environment,
    );
  }

  final AppThemeMode themeMode;
  final Environment environment;
  final void Function(dynamic) onDispatch;

  ThemeData get appTheme {
    if (themeMode.isDark) {
      return const AppDarkTheme().themeData;
    }

    return const AppTheme().themeData;
  }

  String get applicationTitleSuffix =>
      environment.debugLabel.isNotEmpty ? ' - ${environment.debugLabel}' : '';

  @override
  List<Object> get props => [themeMode, environment];
}
