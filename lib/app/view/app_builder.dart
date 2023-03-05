import 'package:app_ui/app_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/l10n/l10n.dart';
import 'package:stars/navigation/app_router.gr.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/theme/actions.dart';

class AppBuilder extends StatelessWidget {
  const AppBuilder({required this.appRouter, super.key});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.from,
      builder: (_, viewModel) {
        return MaterialApp.router(
          title: 'StarXSpace',
          theme: viewModel.appTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
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
  });

  factory _ViewModel.from(final Store<AppState> store) {
    return _ViewModel._(
      onDispatch: store.dispatch,
      themeMode: store.state.themeState.themeMode,
    );
  }

  final AppThemeMode themeMode;
  final void Function(dynamic) onDispatch;

  ThemeData get appTheme {
    if (themeMode.isDark) {
      return const AppDarkTheme().themeData;
    }

    return const AppTheme().themeData;
  }

  @override
  List<Object> get props => [themeMode];
}
