import 'package:go_router/go_router.dart';
import 'package:stars/counter/view/counter_page.dart';

const String initialPath = '/';
const String detailPagePath = '/';

// GoRouter configuration
final _router = GoRouter(
  initialLocation: initialPath,
  routes: [
    GoRoute(
      path: initialPath,
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: detailPagePath,
      builder: (context, state) => const CounterDetail(),
    ),
  ],
);
