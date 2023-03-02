import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/widgets/snapshot_widget_switcher.dart';

import '../mocktails.dart';
import '../widget_test_utils.dart';

void main() {
  late WidgetTestbed testbed;
  late Graph graph;

  setUp(
    () {
      testbed = WidgetTestbed();
      graph = MockGraph();
    },
  );

  testWidgets(
    'created app',
    (final WidgetTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: const SnapshotWidgetSwitcher(
          snapshot: AsyncSnapshot<Graph>.nothing(),
          loadingChild: SizedBox(),
          errorChild: SizedBox(),
          child: SizedBox(),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(
        find.byKey(const Key('snapshot_animated_switcher')),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'create loading widget if graph is building',
    (final WidgetTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: const SnapshotWidgetSwitcher(
          snapshot: AsyncSnapshot<Graph>.nothing(),
          loadingChild: SizedBox(
            key: Key('loading_child'),
          ),
          errorChild: SizedBox(
            key: Key('error_child'),
          ),
          child: SizedBox(
            key: Key('primary_child'),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('loading_child')), findsOneWidget);
    },
  );

  testWidgets(
    'show error child if snapshot has error',
    (final WidgetTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: const SnapshotWidgetSwitcher(
          snapshot: AsyncSnapshot<Graph>.withError(
            ConnectionState.none,
            'error',
          ),
          loadingChild: SizedBox(
            key: Key('initialized_child'),
          ),
          errorChild: SizedBox(
            key: Key('error_child'),
          ),
          child: SizedBox(
            key: Key('primary_child'),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('error_child')), findsOneWidget);
    },
  );

  testWidgets(
    'show child if graph is initialized',
    (final WidgetTester tester) async {
      final testWidget = testbed.simpleWrap(
        child: SnapshotWidgetSwitcher(
          snapshot: AsyncSnapshot.withData(ConnectionState.done, graph),
          loadingChild: const SizedBox(
            key: Key('loading_child'),
          ),
          errorChild: const SizedBox(
            key: Key('error_child'),
          ),
          child: const SizedBox(
            key: Key('primary_child'),
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('primary_child')), findsOneWidget);
    },
  );
}
