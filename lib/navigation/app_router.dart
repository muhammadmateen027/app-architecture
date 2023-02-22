import 'package:auto_route/annotations.dart';
import 'package:stars/counter/view/counter_page.dart';
import 'package:stars/navigation/paths.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: CounterPage,
      initial: true,
      path: initialPath,
    ),
    AutoRoute(page: CounterDetail, path: detailPagePath),
    // RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
