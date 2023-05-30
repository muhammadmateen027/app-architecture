import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:redux/redux.dart';
import 'package:stars/pages/popup/dialog/app_dialog.dart';
import 'package:stars/pages/popup/dialog/app_dialog_id.dart';
import 'package:stars/pages/popup/dialog/dialog_state.dart';
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
  });

  testWidgets(
    'is created',
    (final WidgetTester tester) async {
      final testWidget = testbed.reduxWrap(
        child: AppDialog(
          dialogId: const AppDialogId('app_dialog_id'),
          child: const Offstage(),
          builder: (final context) {
            return const Text('Dialog');
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
        child: AppDialog(
          dialogId: const AppDialogId('app_dialog_id'),
          child: const Offstage(),
          builder: (final context) {
            return const Text('Dialog');
          },
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Dialog'), findsOneWidget);
    },
  );

  testWidgets(
    'Hide dialog on state change',
    (final WidgetTester tester) async {
      builder.withDialogState(popupStatus: PopupStatus.show);
      const dialogId = AppDialogId('app_dialog_id');
      final testWidget = testbed.reduxWrap(
        child: AppDialog(
          dialogId: dialogId,
          child: const Offstage(),
          builder: (final context) {
            return const Text('Dialog');
          },
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Dialog'), findsOneWidget);

      builder.withDialogState(
        popupStatus: PopupStatus.closeByButton,
        dialogId: dialogId,
      );
      testbed.flushActions();
      await tester.pumpAndSettle();

      expect(find.text('Dialog'), findsNothing);
    },
  );

  testWidgets(
    'Show dialog on show state',
    (final WidgetTester tester) async {
      builder.withDialogState(popupStatus: PopupStatus.closeByButton);
      const dialogId = AppDialogId('app_dialog_id');
      final testWidget = testbed.reduxWrap(
        child: AppDialog(
          dialogId: dialogId,
          child: Container(),
          builder: (final context) {
            return const Text('Dialog');
          },
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Dialog'), findsOneWidget);

      builder.withDialogState(
        popupStatus: PopupStatus.show,
        dialogId: dialogId,
      );
      testbed.flushActions();
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsOneWidget);
    },
  );

  testWidgets(
    'hide dialog on different app dialog id',
    (final WidgetTester tester) async {
      const dialogId = AppDialogId('app_dialog_id');
      builder.withDialogState(
        popupStatus: PopupStatus.closeByButton,
        dialogId: dialogId,
      );
      final testWidget = testbed.reduxWrap(
        child: AppDialog(
          dialogId: dialogId,
          child: Container(),
          builder: (final context) {
            return const Text('Dialog');
          },
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      expect(find.text('Dialog'), findsOneWidget);

      builder.withDialogState(
        popupStatus: PopupStatus.show,
        dialogId: const AppDialogId('dialog_two'),
      );
      testbed.flushActions();
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsNothing);
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

  void withDialogState({
    required final PopupStatus popupStatus,
    AppDialogId? dialogId,
  }) {
    state = state.copyWith(
      dialogState: const DialogState.initialState().copyWith(
        status: popupStatus,
        dialogId: dialogId,
      ),
    );
  }

  AppState onReduction(final dynamic event) {
    actions.add(event);

    return state;
  }
}
