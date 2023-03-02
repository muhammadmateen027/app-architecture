import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:helper_options/helper_options.dart';
import 'package:stars/exception/null_lift.dart';

extension EmptyStringExtension on String? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  String get valueOrEmpty => this ?? '';

  Option<String> get optionOrNone =>
      isNotNullOrEmpty ? Option.of(this) : const None();
}

extension StringExtension on String {
  bool get isValidName => !contains(RegExp('[0–9]'));

  String get capitaliseFirstChar =>
      isEmpty ? this : this[0].toUpperCase() + substring(0, length);

  String get capitaliseEachWordFirstChar => isEmpty
      ? this
      : replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.capitaliseFirstChar)
          .join(' ');

  double get toDouble => double.parse(this);

  int get toInt => int.parse(this);

  bool get isUrl => contains('https://') || contains('http://');

  Uri get toUri => Uri.parse(this);
}

extension OptionExtension on Option<String> {
  String? get valueOrNull => map((final value) => value).orNull();

  String valueOrElse(final String placeHolder) =>
      map((final value) => value).orElse(placeHolder);

  bool get isPresentAndNotEmpty => isPresent && value.isNotEmpty;
}

extension NullableOptionExtension on Option<String>? {
  String valueOrElse(final String placeHolder) =>
      this?.map((final name) => name).orElse(placeHolder) ?? placeHolder;
}

extension IntExtension on int? {
  int get valueOrZero => this ?? 0;
}

extension DoubleExtension on double? {
  double get valueOrZero => this ?? 0;
}

extension BoolExtension on bool? {
  bool isValue(final bool value) => this == value;
}

extension LiftGenericExtensions<T extends Object> on T? {
  T get liftNonNull {
    try {
      assert(this != null);
      return this!;
      //ignore: avoid_catching_errors
    } on AssertionError catch (e) {
      throw NullLiftException(
        'It was not possible to lift this object ${e.toString()}',
      );
    }
  }
}

extension ListExtension<T> on List<T> {
  bool hasExact(final int value) => length == value;
}

extension JsonConverterExtension on dynamic {
  String get stringify => jsonEncode(this);
}

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

extension DateTimeExension on DateTime {
  bool isSameDay(final DateTime other) =>
      day == other.day && month == other.month && year == other.year;

  bool isLaterOrEqualDay(final DateTime other) =>
      isSameDay(other) || isAfter(other);

  Duration difference(DateTime dateTime) => this.difference(dateTime);

  DateTime get firstDayOfMonth => DateTime(year, month);

  DateTime get firstDayOfNextMonth => DateTime(year, month + 1);

  DateTime get secondDayOfNextMonth => DateTime(year, month + 1, 2);

  DateTime get lastDayOfPreviousMonth => DateTime(year, month, 0);
}
