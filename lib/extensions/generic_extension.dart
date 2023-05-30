import 'package:stars/exception/null_lift.dart';

extension LiftGenericExtensions<T extends Object> on T? {
  T get liftNonNull {
    try {
      assert(this != null);
      return this!;
      //ignore: avoid_catching_errors
    } on AssertionError catch (e) {
      throw NullLiftException(
        'It was not possible to lift this object ${e.toString()}',
      );
    }
  }
}
