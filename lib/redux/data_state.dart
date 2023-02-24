import 'package:meta/meta.dart';

@immutable
class DataState {
  const DataState({required this.loadingState, this.exception});

  const DataState.none()
      : this(loadingState: LoadingState.none, exception: null);

  const DataState.error(Object exception)
      : this(loadingState: LoadingState.error, exception: exception);

  const DataState.partial()
      : this(loadingState: LoadingState.partial, exception: null);

  const DataState.full()
      : this(loadingState: LoadingState.full, exception: null);

  const DataState.loading()
      : this(loadingState: LoadingState.loading, exception: null);

  final LoadingState loadingState;
  final Object? exception;

  bool get hasException => loadingState == LoadingState.error;

  bool get isLoading => loadingState == LoadingState.loading;

  bool get isFull => loadingState == LoadingState.full;

  bool get isNone => loadingState == LoadingState.none;

  @override
  String toString() {
    return 'DataState{loadingState: $loadingState, exception: $exception}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataState &&
          runtimeType == other.runtimeType &&
          loadingState == other.loadingState &&
          exception == other.exception;

  @override
  int get hashCode => loadingState.hashCode ^ exception.hashCode;
}

enum LoadingState { none, partial, loading, full, error }
