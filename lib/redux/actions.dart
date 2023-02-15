import 'package:meta/meta.dart';

@immutable
abstract class Action {
  const Action();

  @override
  String toString() {
    return '$runtimeType';
  }

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is Action && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

@immutable
abstract class ExceptionAction extends Action {
  const ExceptionAction(this.exception, [this.stackTrace]);

  final Object exception;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return '$runtimeType{exception: $exception, '
        'stackTrace: ${stackTrace ?? "--"}}';
  }

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is ExceptionAction && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
