import 'package:stars/pages/popup/actions.dart';
import 'package:stars/pages/popup/dialog/dialog_state.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';

DialogState dialogReducer(
  final DialogState state,
  final dynamic action,
) {
  if (action is ShowDialogAction) {
    return state.copyWith(
      status: PopupStatus.show,
      dialogId: action.dialogId,
    );
  } else if (action is HideDialogAction) {
    return state.copyWith(
      status: action.status,
      dialogId: action.dialogId,
    );
  }

  return state;
}
