import 'package:test/test.dart';

Matcher throwsAssertionError() => throwsA(isA<AssertionError>());
