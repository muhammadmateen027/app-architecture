import 'package:meta/meta.dart';
import 'package:stars/redux/data_state.dart';

@immutable
class StartupState {
  const StartupState._({
    required this.dataState,
  });

  const StartupState.initialState() : dataState = const DataState.none();

  final DataState dataState;

  StartupState copyWith({
    final DataState? dataState,
  }) {
    return StartupState._(
      dataState: dataState ?? this.dataState,
    );
  }
}
