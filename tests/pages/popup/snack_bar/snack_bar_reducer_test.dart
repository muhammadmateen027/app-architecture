import 'package:stars/pages/popup/actions.dart';
import 'package:stars/pages/popup/snack_bar/snack_bar_reducer.dart';
import 'package:stars/pages/popup/snack_bar/snack_bar_state.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';
import 'package:stars/pages/spacex/redux/actions.dart';
import 'package:test/test.dart';

void main() {
  test(
    'action is not found then return snack bar state',
    () {
      const oldState = SnackBarState.initialState();

      final newState = snackBarReducer(
        oldState,
        const FetchLaunchesAction(),
      );

      expect(newState, oldState);
    },
  );

  test(
    'show snack bar on action',
    () {
      const oldState = SnackBarState.initialState();

      final newState = snackBarReducer(
        oldState,
        const ShowSnackBarAction(String),
      );

      expect(newState.status, PopupStatus.show);
    },
  );

  test(
    'hide snack bar on action',
    () {
      const oldState = SnackBarState.initialState();

      final newState = snackBarReducer(
        oldState,
        const HideSnackBarAction(),
      );

      expect(newState.status, PopupStatus.closeByButton);
      expect(newState.screen, isNull);
    },
  );
}
