import 'package:auto_route/annotations.dart';
import 'package:stars/counter/view/counter_page.dart';
import 'package:stars/navigation/paths.dart';
import 'package:stars/spacex/spacex.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SpaceXLaunches,
      initial: true,
      path: initialPath,
    ),
    AutoRoute(page: CounterDetail, path: detailPagePath),
    // RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
