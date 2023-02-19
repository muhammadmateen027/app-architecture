import 'package:auto_route/annotations.dart';
import 'package:stars/spacex/spacex.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LaunchesListPage,
      initial: true,
      path: '/',
    ),
    AutoRoute(page: LaunchDetailPage),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
