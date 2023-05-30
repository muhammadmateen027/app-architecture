import 'package:stars/utils/optionals/optionals.dart';

extension StringOptionExtension on Option<String> {
  String? get valueOrNull => map((final value) => value).orNull();

  String get emptyOrValue => isPresent ? value : '';

  String valueOrElse(final String placeHolder) =>
      map((final value) => value).orElse(placeHolder);

  bool get isPresentAndNotEmpty => isPresent && value.isNotEmpty;
}

extension DoubleOptionExtension on Option<double> {
  double? get valueOrNull => map((final double value) => value).orNull();

  double valueOrElse(final double placeHolder) =>
      map((final value) => value).orElse(placeHolder);
}

extension NullableStringOptionExtension on Option<String>? {
  String valueOrElse(final String placeHolder) =>
      this?.map((final name) => name).orElse(placeHolder) ?? placeHolder;
}
