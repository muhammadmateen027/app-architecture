import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stars/system/app_lifecycle/state.dart';
import 'package:stars/system/app_lifecycle/state_observer.dart';

import '../../widget_test_utils.dart';

void main() {
  late WidgetTestbed testbed;

  setUp(
    () {
      testbed = WidgetTestbed();
      WidgetsBinding.instance
          .handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    },
  );

  testWidgets(
    'is created',
    (final WidgetTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: StateObserver(
          onLifecycleChanged: (final _) {},
          child: const SizedBox(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'find child widget',
    (final WidgetTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: StateObserver(
          onLifecycleChanged: (final _) {},
          child: const SizedBox(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byType(SizedBox), findsOneWidget);
    },
  );

  testWidgets(
    'on state changed is triggered when app goes to foreground',
    (final WidgetTester tester) async {
      var state = LifecycleState.background;

      final testWidget = testbed.simpleWrap(
        child: StateObserver(
          onLifecycleChanged: (final s) {
            state = s;
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      WidgetsBinding.instance
          .handleAppLifecycleStateChanged(AppLifecycleState.resumed);

      expect(state, LifecycleState.foreground);
    },
  );

  testWidgets(
    'on state changed is triggered when app goes to inactive',
    (final WidgetTester tester) async {
      var state = LifecycleState.foreground;

      final testWidget = testbed.simpleWrap(
        child: StateObserver(
          onLifecycleChanged: (final s) {
            state = s;
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      WidgetsBinding.instance
          .handleAppLifecycleStateChanged(AppLifecycleState.inactive);

      expect(state, LifecycleState.background);
    },
  );

  testWidgets(
    'on position changed is triggered when app goes to paused',
    (final WidgetTester tester) async {
      var position = LifecycleState.foreground;

      final testWidget = testbed.simpleWrap(
        child: StateObserver(
          onLifecycleChanged: (final p) {
            position = p;
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      WidgetsBinding.instance
          .handleAppLifecycleStateChanged(AppLifecycleState.paused);

      expect(position, LifecycleState.paused);
    },
  );

  testWidgets(
    'on position changed is triggered when app goes to detached',
    (final WidgetTester tester) async {
      var position = LifecycleState.foreground;

      final testWidget = testbed.simpleWrap(
        child: StateObserver(
          onLifecycleChanged: (final p) {
            position = p;
          },
          child: const SizedBox(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      WidgetsBinding.instance
          .handleAppLifecycleStateChanged(AppLifecycleState.detached);

      expect(position, LifecycleState.background);
    },
  );
}
