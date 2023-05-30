import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stars/app/view/app.dart';
import 'package:stars/navigation/app_router.gr.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/initializer.dart';
import 'package:stars/system/startup/injector.dart';
import 'package:stars/system/startup/modules/base.dart';
import 'package:stars/system/startup/modules/modules.dart';

import 'stub/stub_responser.dart';
import 'utils/test_modules.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // ignore: unused_local_variable
  late Widget app;
  late Graph graph;
  late List<Module<dynamic>> testModules;

  Future<void> initializeApp() async {
    graph = await Initializer(testModules).initialise();

    app = InjectorWidget(
      graph: graph,
      child: Application(graph: graph, appRouter: AppRouter()),
    );
  }

  setUp(() async {
    testModules = modules
        .replace(
          moduleType: EnvironmentModule,
          replacement: const EnvironmentTestModule(),
        )
        .replace(
          moduleType: TimeDilationModule,
          replacement: const TimeDilationTestModule(),
        )
        .replace(
          moduleType: InternalRestModule,
          replacement: InternalRestTestModule(StubResponderImpl()),
        );

    await initializeApp();
  });

  tearDown(() => graph.dispose());

  tearDownAll(() async {});
}
