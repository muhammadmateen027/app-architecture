import 'package:flutter/foundation.dart';

@immutable
class AppDialogId {
  const AppDialogId(this.id);

  final String id;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is AppDialogId &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'AppDialogId{id: $id}';
  }
}
