import 'package:meta/meta.dart';
import 'package:stars/pages/popup/utils/popup_status.dart';

@immutable
class SnackBarState {
  const SnackBarState._({
    required this.status,
    required this.screen,
  });

  const SnackBarState.initialState()
      : status = PopupStatus.closeByButton,
        screen = null;

  final PopupStatus status;
  final Type? screen;

  SnackBarState copyWith({
    final PopupStatus? status,
    final Type? screen,
  }) {
    return SnackBarState._(
      status: status ?? this.status,
      screen: screen ?? this.screen,
    );
  }

  SnackBarState reset() {
    return const SnackBarState._(
      status: PopupStatus.closeByButton,
      screen: null,
    );
  }
}
