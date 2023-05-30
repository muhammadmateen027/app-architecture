import 'package:flutter/foundation.dart';
import 'package:stars/pages/popup/dialog/app_dialog_id.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';
import 'package:stars/redux/actions.dart';

@immutable
class ShowDialogAction extends Action {
  const ShowDialogAction(this.dialogId);

  final AppDialogId dialogId;

  @override
  String toString() {
    return 'ShowDialogAction{dialogId: $dialogId}';
  }
}

@immutable
class HideDialogAction extends Action {
  const HideDialogAction({
    this.dialogId,
    this.status = PopupStatus.closeByButton,
  });

  final AppDialogId? dialogId;
  final PopupStatus status;

  @override
  String toString() {
    return 'HideDialogAction{dialogId: $dialogId, status: $status}';
  }
}

@immutable
class ShowSnackBarAction extends Action {
  const ShowSnackBarAction(this.screen);

  final Type screen;

  @override
  String toString() {
    return 'ShowSnackBarAction{screen: $screen}';
  }
}

@immutable
class HideSnackBarAction extends Action {
  const HideSnackBarAction();
}
