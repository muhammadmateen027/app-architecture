import 'package:flutter/foundation.dart';
import 'package:stars/pages/popup/dialog/app_dialog_id.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';

@immutable
class DialogState {
  const DialogState._({
    required this.status,
    required this.dialogId,
  });

  const DialogState.initialState()
      : status = PopupStatus.closeByButton,
        dialogId = null;

  final PopupStatus status;
  final AppDialogId? dialogId;

  DialogState copyWith({
    final PopupStatus? status,
    final AppDialogId? dialogId,
  }) {
    return DialogState._(
      status: status ?? this.status,
      dialogId: dialogId ?? dialogId,
    );
  }
}
