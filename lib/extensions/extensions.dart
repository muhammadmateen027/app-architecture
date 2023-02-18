import 'package:helper_options/helper_options.dart';
import 'package:stars/exception/null_lift.dart';

extension Extension on String? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  String get valueOrEmpty => this ?? '';

  Option<String> get optionOrNone =>
      isNotNullOrEmpty ? Option.of(this) : const None();
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
