import 'package:stars/exception/low_priority.dart';

class OfflineException implements LowPriorityException {
  const OfflineException();

  @override
  String toString() => 'OfflineException';
}
