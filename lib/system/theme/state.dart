import 'package:stars/system/theme/actions.dart';

class ThemeState {
  const ThemeState({required this.themeMode});

  const ThemeState.initialState() : themeMode = AppThemeMode.light;

  final AppThemeMode themeMode;

  ThemeState copyWith({final AppThemeMode? themeMode}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
