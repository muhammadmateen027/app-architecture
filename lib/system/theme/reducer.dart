import 'package:stars/system/theme/actions.dart';
import 'package:stars/system/theme/state.dart';

ThemeState themeReducer(
  final ThemeState state,
  final dynamic action,
) {
  if (action is SwitchThemeSucceededAction) {
    return state.copyWith(themeMode: action.themeMode);
  }

  return state;
}
