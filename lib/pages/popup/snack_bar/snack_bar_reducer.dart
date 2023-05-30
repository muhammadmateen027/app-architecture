import 'package:stars/pages/popup/actions.dart';
import 'package:stars/pages/popup/snack_bar/snack_bar_state.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';

SnackBarState snackBarReducer(
  final SnackBarState state,
  final dynamic action,
) {
  if (action is ShowSnackBarAction) {
    return state.copyWith(
      status: PopupStatus.show,
      screen: action.screen,
    );
  } else if (action is HideSnackBarAction) {
    return state.reset();
  }

  return state;
}
