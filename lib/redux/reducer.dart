import 'package:stars/redux/app_state.dart';
import 'package:stars/redux/core.dart';

AppState reducer(final AppState state, final dynamic action) {
  return appReducer(state, action);
}
