import 'package:stars/redux/actions.dart';

enum AppThemeMode { light, dark }

class SwitchThemeAction extends Action {
  const SwitchThemeAction(this.themeMode);

  final AppThemeMode themeMode;

  @override
  String toString() => 'SwitchThemeAction{themeMode: $themeMode}';
}

class SwitchThemeSucceededAction extends Action {
  const SwitchThemeSucceededAction(this.themeMode);

  final AppThemeMode themeMode;

  @override
  String toString() => 'SwitchThemeSucceededAction{themeMode: $themeMode}';
}

class SwitchThemeFailedAction extends ExceptionAction {
  const SwitchThemeFailedAction(
    final Object exception, [
    final StackTrace? stackTrace,
  ]) : super(exception, stackTrace);
}

extension AppThemeModeExtension on AppThemeMode {
  bool get isLight => this == AppThemeMode.light;

  bool get isDark => this == AppThemeMode.dark;
}
