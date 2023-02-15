import 'package:stars/api/exception/low_priority.dart';

class OfflineException implements LowPriorityException {
  const OfflineException();

  @override
  String toString() => 'OfflineException';
}
