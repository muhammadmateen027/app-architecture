import 'package:auto_route/annotations.dart';
import 'package:stars/navigation/paths.dart';
import 'package:stars/pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SpaceXLaunches,
      initial: true,
      path: initialPath,
    ),
    AutoRoute(page: LaunchDetailPage, path: detailPagePath),
    // RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
