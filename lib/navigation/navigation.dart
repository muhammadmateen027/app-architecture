import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stars/navigation/paths.dart';

import '../redux/app_state.dart';
import '../system/startup/injector.dart';
import 'navigation_view_model.dart';

//
// abstract class FeedPage extends Page<dynamic> {
//   const FeedPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class SplashPage extends Page<dynamic> {
//   const SplashPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class AdPage extends Page<dynamic> {
//   const AdPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class RemoteConfigPage extends Page<dynamic> {
//   const RemoteConfigPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class DebugPage extends Page<dynamic> {
//   const DebugPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class OnboardingPage extends Page<dynamic> {
//   const OnboardingPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class TypographyPage extends Page<dynamic> {
//   const TypographyPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class ColorsPage extends Page<dynamic> {
//   const ColorsPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class ComponentsPage extends Page<dynamic> {
//   const ComponentsPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class NewsCardsPage extends Page<dynamic> {
//   const NewsCardsPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class ErrorScreensPage extends Page<dynamic> {
//   const ErrorScreensPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class AccountPage extends Page<dynamic> {
//   const AccountPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class NotificationsPage extends Page<dynamic> {
//   const NotificationsPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class GamesPage extends Page<dynamic> {
//   const GamesPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class CalendarPage extends Page<dynamic> {
//   const CalendarPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class EditAccountPage extends Page<dynamic> {
//   const EditAccountPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class UpdatePasswordPage extends Page<dynamic> {
//   const UpdatePasswordPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class DetailPage extends Page<dynamic> {
//   const DetailPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class MatchPage extends Page<dynamic> {
//   const MatchPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class MemePage extends Page<dynamic> {
//   const MemePage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class MemeCreatorPage extends Page<dynamic> {
//   const MemeCreatorPage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class ProfilePage extends Page<dynamic> {
//   const ProfilePage({
//     super.key,
//     super.name,
//   });
// }
//
// abstract class BadgesPage extends Page<dynamic> {
//   const BadgesPage({
//     super.key,
//     super.name,
//   });
// }

class NavigationRouteInformationParser
    extends RouteInformationParser<PageRoutePath> {
  @override
  Future<PageRoutePath> parseRouteInformation(
    final RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location ?? '');
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return const PageRoutePath.starList();
    }

    // Handle unknown routes
    return const PageRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(final PageRoutePath configuration) {
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/404');
    }
    if (configuration == const PageRoutePath.starList()) {
      return const RouteInformation(location: '/');
    }

    return null;
  }
}

class NavigationRouterDelegate extends RouterDelegate<PageRoutePath>
    with
        // ignore: prefer_mixin
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<PageRoutePath> {
  NavigationRouterDelegate({
    required this.pages,
  }) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final Map<PageRoutePath, Page<dynamic>> pages;

  bool show404 = false;

  @override
  Widget build(final BuildContext context) {
    return StoreConnector<AppState, NavigationViewModel>(
      distinct: true,
      converter: NavigationViewModel.from,
      onDidChange: (final _, final __) => notifyListeners(),
      builder: (final context, final viewModel) {
        return Navigator(
          key: navigatorKey,
          observers: [
            InjectorWidget.of(context).analyticsObserver,
          ],
          pages: createPages(viewModel),
          onPopPage: (final route, final result) {
            viewModel.onBack();

            if (!route.didPop(result)) {
              return false;
            }

            return true;
          },
        );
      },
    );
  }

  List<Page<dynamic>> createPages(final NavigationViewModel viewModel) {
    return [
      // if (viewModel.showFeed) pages[const PageRoutePath.feed()]!,
      ...viewModel.pageStack.map((final p) => pages[p]).whereNotNull().toList(),
      if (show404)
        const MaterialPage(
          key: ValueKey('UnknownPage'),
          child: UnknownScreen(),
        ),
      // if (viewModel.showSplash) pages[const PageRoutePath.splash()]!,
    ];
  }

  @override
  PageRoutePath get currentConfiguration {
    if (show404) {
      return const PageRoutePath.unknown();
    }

    return const PageRoutePath.starList();
  }

  @override
  Future<void> setNewRoutePath(final PageRoutePath configuration) async {
    if (configuration.isUnknown) {
      show404 = true;

      return;
    }

    show404 = false;
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404!'),
      ),
    );
  }
}
