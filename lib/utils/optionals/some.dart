import 'package:flutter/foundation.dart';
import 'package:stars/utils/optionals/optionals.dart';

// ignore_for_file: use_function_type_syntax_for_parameters
// ignore_for_file: prefer_final_parameters

@immutable
class Some<T> implements Option<T> {
  const Some(this._value);

  final T _value;

  @override
  T get nullable => _value;

  @override
  T get value => _value;

  @override
  bool get isPresent => true;

  @override
  Option<T> filter(bool predicate(T val)) =>
      predicate(_value) ? this as Option<T> : const None();

  @override
  Option<R> flatMap<R>(Option<R> mapper(T val)) => mapper(_value);

  @override
  Option<R> map<R>(R mapper(T val)) => Option<R>.of(mapper(_value));

  @override
  Option<OUT> lift<IN, OUT>(
    final Option<IN> option1,
    final OUT Function(T val0, IN val1) mapper,
  ) =>
      option1.map((final it) => mapper(_value, it));

  @override
  dynamic orElse(final dynamic other) => _value;

  @override
  dynamic orNull() => _value;

  @override
  T orElseThrow(dynamic supplyError()) => _value;

  @override
  void ifPresent(void consume(T val), {void orElse()?}) =>
      Function.apply(consume, [_value]);

  @override
  R orElseOfType<R>(final dynamic other) {
    return this is Option<R>
        ? (this as Option<R>).value
        : throw CastException(value, R.runtimeType);
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(final Object other) =>
      other is Some<T> && other._value == _value;

  @override
  String toString() => 'Option[value: $_value]';

  @override
  Option<R> ofType<R>() {
    return _value is R ? this as Option<R> : const None();
  }
}
