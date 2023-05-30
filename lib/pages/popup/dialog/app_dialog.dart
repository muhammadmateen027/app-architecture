import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stars/pages/popup/actions.dart';
import 'package:stars/pages/popup/dialog/app_dialog_id.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';
import 'package:stars/redux/app_state.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.builder,
    required this.child,
    required this.dialogId,
    this.barrierDismissible = false,
    super.key,
  });

  final Widget Function(BuildContext) builder;
  final Widget child;
  final AppDialogId dialogId;
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.from,
      builder: (final context, final viewModel) => builder(context),
      onWillChange: (final oldViewModel, final viewModel) {
        viewModel
          ..show(
            context,
            child,
            dialogId,
            barrierDismissible,
          )
          ..hide(context, dialogId);
      },
    );
  }
}

@immutable
class _ViewModel {
  const _ViewModel._({
    required this.onDispatch,
    required this.dialogId,
    required this.status,
  });

  factory _ViewModel.from(final Store<AppState> store) {
    return _ViewModel._(
      onDispatch: store.dispatch,
      dialogId: store.state.dialogState.dialogId,
      status: store.state.dialogState.status,
    );
  }

  final AppDialogId? dialogId;
  final PopupStatus status;

  final void Function(dynamic) onDispatch;

  void show(
    BuildContext context,
    Widget dialogBody,
    final AppDialogId dialogId,
    final bool barrierDismissible,
  ) {
    if (status.isVisible && dialogId == this.dialogId) {
      showDialog<void>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) => dialogBody,
      ).then((value) {
        if (barrierDismissible) {
          onDismissDialog(dialogId);
        }
      });
    }
  }

  void onDismissDialog(final AppDialogId dialogId) => onDispatch(
        HideDialogAction(
          dialogId: dialogId,
          status: PopupStatus.closeByBarrier,
        ),
      );

  void hide(final BuildContext context, final AppDialogId dialogId) {
    if (_isClosedByBarrier(dialogId)) {
      return;
    } else if (_isClosedByButton(dialogId)) {
      _dismissDialog(context);
    }
  }

  bool _isClosedByButton(AppDialogId dialogId) =>
      status.isClosedByButton && dialogId == this.dialogId;

  bool _isClosedByBarrier(AppDialogId dialogId) =>
      status.isClosedByBarrier && dialogId == this.dialogId;

  void _dismissDialog(final BuildContext context, {final bool? result}) {
    Navigator.of(context, rootNavigator: true).pop(result);
  }

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          dialogId == other.dialogId &&
          status == other.status;

  @override
  int get hashCode => dialogId.hashCode ^ status.hashCode;
}
