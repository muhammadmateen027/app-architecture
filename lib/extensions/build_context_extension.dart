import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  StackRouter get toRoute => AutoRouter.of(this);

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  Color get primaryColor => colorScheme.primary;

  Color get secondaryColor => colorScheme.secondary;

  Color get backgroundColor => colorScheme.background;

  Color get onBackgroundColor => colorScheme.onBackground;

  Color get onError => colorScheme.onError;

  TextTheme get textTheme => theme.textTheme;

  ButtonThemeData get buttonTheme => theme.buttonTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get aspectRatio => size.aspectRatio;

  double get height => size.height;

  double get width => size.width;

  bool get isMobile => width < 650;

  bool get isTablet => width < 1024 && width >= 650;

  bool get isDesktop => width >= 1024;

  NavigatorState get navigate => Navigator.of(this);

  void pop([Object? object]) => navigate.pop(object);

  Future<T?> push<T>(Route<T> route) => navigate.push(route);

  Future<Object?> pushName(String routeName, {Object? arguments}) =>
      navigate.pushNamed(routeName, arguments: arguments);
}
