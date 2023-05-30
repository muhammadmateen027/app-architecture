import 'package:stars/utils/optionals/optionals.dart';

extension NullableStringExtension on String? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  String get valueOrEmpty => this ?? '';

  Option<String> get optionOrNone =>
      isNotNullOrEmpty ? Option.of(this) : const None();

  Option<String> get toOption => Option.of(this);
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
