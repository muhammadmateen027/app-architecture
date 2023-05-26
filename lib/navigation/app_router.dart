import 'package:auto_route/auto_route.dart';
import 'package:stars/counter/view/counter_page.dart';
import 'package:stars/navigation/paths.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: CounterPage, initial: true, path: initialPath),
  ],
)
class $AppRouter {}
