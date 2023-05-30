import 'package:flutter/foundation.dart';
import 'package:stars/utils/optionals/optionals.dart';

// ignore_for_file: use_function_type_syntax_for_parameters
// ignore_for_file: prefer_final_parameters

@immutable
abstract class Option<T> {
  factory Option.of(final T? value) {
    final val = value;
    if (val == null) {
      return const None();
    } else {
      return Some<T>(val);
    }
  }

  factory Option.first(final Iterable<T> list) {
    if (list.isEmpty) {
      return const None();
    } else {
      return Some<T>(list.first);
    }
  }

  factory Option.ofFunction(final T Function() value) {
    try {
      return Option.of(value());
    } on Exception {
      return const None();
    }
  }

  T get value;

  T? get nullable;

  bool get isPresent;

  /// Creates an empty Option.
  static Option<T> empty<T>() => const None();

  /// Returns an Option with this Option's value, if there is a value present
  /// and it matches the predicate.  Otherwise, returns an empty Option.
  Option<T> filter(bool predicate(T val));

  /// Returns an Option provided by applying the mapper to this Option's value,
  /// if present.  Otherwise, returns an empty Option.
  Option<R> flatMap<R>(Option<R> mapper(T val));

  Option<R> map<R>(R mapper(T val));

  Option<R> ofType<R>();

  Option<OUT> lift<IN, OUT>(
    final Option<IN> option1,
    OUT mapper(T val0, IN val1),
  );

  /// Returns this Option's value, if present.  Otherwise, returns other.
  dynamic orElse(final dynamic other);

  /// Returns this Option's value, if present.  Otherwise, returns null.
  /// Can be dangerous!
  dynamic orNull();

  /// Returns this Option's value, if present.
  /// Otherwise, throws the result of calling supplyError().
  T orElseThrow(final dynamic Function() supplyError);

  /// Invokes consume() with this Option's value, if present.
  /// Otherwise, if orElse is passed, invokes it, otherwise does nothing.
  void ifPresent(
    final void Function(T val) consume, {
    final void Function() orElse,
  });

  R orElseOfType<R>(final dynamic other);

  /// The hashCode of this Option's value, if present.  Otherwise, 0.
  @override
  int get hashCode;

  @override
  bool operator ==(final Object other);
}
