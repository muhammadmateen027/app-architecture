import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:redux/redux.dart';
import 'package:stars/pages/popup/snack_bar/app_snack_bar.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';
import 'package:stars/redux/app_state.dart';
import 'package:stars/system/startup/graph.dart';

import '../../../mocktails.dart';
import '../../../widget_test_utils.dart';

void main() {
  late WidgetTestbed testbed;
  late Store<AppState> store;
  late Graph graph;
  late _ArrangeBuilder builder;
  late List<dynamic> actions;

  setUp(() {
    // isUnderTest = true;
    store = MockStore();
    graph = MockGraph();
    actions = [];

    builder = _ArrangeBuilder(
      store,
      graph,
      actions,
    );
    testbed = WidgetTestbed(
      graph: graph,
      store: store,
      onReduction: builder.onReduction,
    );
    // VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  testWidgets(
    'is created',
    (final WidgetTester tester) async {
      final testWidget = testbed.reduxWrap(
        child: AppSnackBar<Type>(
          child: const Text('SnackBar'),
          builder: (final context) {
            return const Text('Body');
          },
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
    },
  );

  testWidgets(
    'find builder content',
    (final WidgetTester tester) async {
      final testWidget = testbed.reduxWrap(
        child: AppSnackBar<Type>(
          child: const Text('SnackBar'),
          builder: (final context) {
            return const Text('Body');
          },
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Body'), findsOneWidget);
    },
  );

  testWidgets(
    'Hide snackbar on initial state',
    (final WidgetTester tester) async {
      const String helloSnackBar = 'Hello SnackBar';
      builder.withSnackBarState(popupStatus: PopupStatus.closeByButton);
      final testWidget = testbed.reduxWrap(
        child: Scaffold(
          body: AppSnackBar<Type>(
            child: const Text(helloSnackBar),
            builder: (final context) {
              return const Text('Body');
            },
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text(helloSnackBar), findsNothing);
    },
  );

  testWidgets(
    'Show snack bar on show state',
    (final WidgetTester tester) async {
      const String helloSnackBar = 'Hello SnackBar';
      builder.withSnackBarState(popupStatus: PopupStatus.closeByButton);
      final testWidget = testbed.reduxWrap(
        child: Scaffold(
          body: AppSnackBar<Type>(
            child: const Text(helloSnackBar),
            builder: (final context) {
              return const Text('Body');
            },
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Body'), findsOneWidget);

      builder.withSnackBarState(
        popupStatus: PopupStatus.show,
        screen: Type,
      );
      testbed.flushActions();
      await tester.pumpAndSettle();

      expect(find.text(helloSnackBar), findsOneWidget);
    },
  );

  testWidgets(
    'do not show snack bar different type of screen',
    (final WidgetTester tester) async {
      const String helloSnackBar = 'Hello SnackBar';
      builder.withSnackBarState(popupStatus: PopupStatus.closeByButton);
      final testWidget = testbed.reduxWrap(
        child: Scaffold(
          body: AppSnackBar<Type>(
            child: const Text(helloSnackBar),
            builder: (final context) {
              return const Text('Body');
            },
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Body'), findsOneWidget);

      builder.withSnackBarState(
        popupStatus: PopupStatus.show,
        screen: Text,
      );
      testbed.flushActions();
      await tester.pumpAndSettle();

      expect(find.text(helloSnackBar), findsNothing);
    },
  );

  testWidgets(
    'hide snack bar after showing once',
    (final WidgetTester tester) async {
      const String helloSnackBar = 'Hello SnackBar';
      builder.withSnackBarState(popupStatus: PopupStatus.closeByButton);
      final testWidget = testbed.reduxWrap(
        child: Scaffold(
          body: AppSnackBar<Type>(
            child: const Text(helloSnackBar),
            builder: (final context) {
              return const Text('Body');
            },
          ),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Body'), findsOneWidget);

      builder.withSnackBarState(
        popupStatus: PopupStatus.show,
        screen: Type,
      );
      testbed.flushActions();
      await tester.pumpAndSettle();

      expect(find.text(helloSnackBar), findsOneWidget);

      builder.withSnackBarState(
        popupStatus: PopupStatus.closeByButton,
        screen: Type,
      );
      testbed.flushActions();
      await tester.pumpAndSettle(const Duration(seconds: 4));

      expect(find.text(helloSnackBar), findsNothing);
    },
  );
}

class _ArrangeBuilder {
  _ArrangeBuilder(
    this.store,
    this.graph,
    this.actions,
  ) {
    state = AppState.initialState();
    when(() => store.state).thenAnswer((final _) => state);
  }

  final Store<AppState> store;
  final List<dynamic> actions;
  final Graph graph;
  late AppState state;

  void withSnackBarState({
    required final PopupStatus popupStatus,
    Type? screen,
  }) {
    state = state.copyWith(
      snackBarState: state.snackBarState.copyWith(
        status: popupStatus,
        screen: screen,
      ),
    );
  }

  AppState onReduction(final dynamic event) {
    actions.add(event);

    return state;
  }
}
