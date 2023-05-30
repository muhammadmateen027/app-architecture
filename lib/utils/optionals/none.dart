import 'package:flutter/foundation.dart';
import 'package:stars/utils/optionals/optionals.dart';

// ignore_for_file: use_function_type_syntax_for_parameters
// ignore_for_file: prefer_final_parameters

@immutable
class None<T> implements Option<T> {
  const None();

  @override
  T get value => throw NoValuePresentError();

  @override
  T? get nullable => null;

  @override
  bool get isPresent => false;

  @override
  Option<T> filter(bool predicate(T val)) => this;

  @override
  Option<R> flatMap<R>(Option<R> mapper(T val)) => const None();

  @override
  Option<R> map<R>(R mapper(T val)) => const None();

  @override
  Option<OUT> lift<IN, OUT>(
    final Option<IN> option1,
    final OUT Function(T val0, IN val1) mapper,
  ) {
    return const None();
  }

  @override
  dynamic orElse(final dynamic other) => other;

  @override
  dynamic orNull() => null;

  @override
  T orElseThrow(dynamic supplyError()) => throw supplyError();

  @override
  void ifPresent(void consume(T val), {void orElse()?}) =>
      orElse != null ? orElse() : null;

  @override
  R orElseOfType<R>(final dynamic other) =>
      other is R ? other : throw CastException(value, R.runtimeType);

  @override
  int get hashCode => 0;

  @override
  bool operator ==(final Object other) => other is None<T>;

  @override
  String toString() => 'Option[empty]';

  @override
  Option<R> ofType<R>() {
    return const None();
  }
}
