import 'package:helper_options/helper_options.dart';

extension LiftGenericExtensions<T extends Object> on T? {
  T get liftNonNull {
    try {
      assert(this != null, 'Should not be a null');

      return this!;
      //ignore: avoid_catching_errors
    } on AssertionError catch (e) {
      throw NullLiftException(
        'It was not possible to lift this object $e',
      );
    }
  }
}
