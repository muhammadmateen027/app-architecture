import 'package:stars/utils/optionals/option.dart';

extension DoubleExtension on double? {
  double get valueOrZero => this ?? 0;
}

extension NullableDoubleOptionExtension on Option<double>? {
  double valueOrElse(final double placeHolder) =>
      this?.map((final name) => name).orElse(placeHolder) ?? placeHolder;
}
