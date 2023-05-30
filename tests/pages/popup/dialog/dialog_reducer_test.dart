import 'package:stars/pages/popup/actions.dart';
import 'package:stars/pages/popup/dialog/app_dialog_id.dart';
import 'package:stars/pages/popup/dialog/dialog_reducer.dart';
import 'package:stars/pages/popup/dialog/dialog_state.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';
import 'package:stars/pages/spacex/redux/actions.dart';
import 'package:test/test.dart';

void main() {
  test(
    'action is not found then return dialog state',
    () {
      const oldState = DialogState.initialState();

      final newState = dialogReducer(oldState, const FetchLaunchesAction());

      expect(newState, oldState);
    },
  );

  test(
    'show dialog on actions',
    () {
      const oldState = DialogState.initialState();

      final newState = dialogReducer(
        oldState,
        const ShowDialogAction(AppDialogId('app_dialog_id')),
      );

      expect(newState.status, PopupStatus.show);
    },
  );

  test(
    'hide dialog on actions',
    () {
      const oldState = DialogState.initialState();
      const dialogId = AppDialogId('app_dialog_id');

      final newState = dialogReducer(
        oldState,
        const HideDialogAction(dialogId: dialogId),
      );

      expect(newState.status, PopupStatus.closeByButton);
      expect(newState.dialogId, dialogId);
    },
  );

  test(
    'reset dialog state on action',
    () {
      const oldState = DialogState.initialState();

      final newState = dialogReducer(
        oldState,
        const HideDialogAction(status: PopupStatus.closeByBarrier),
      );

      expect(newState.status, PopupStatus.closeByBarrier);
      expect(newState.dialogId, isNull);
    },
  );
}
