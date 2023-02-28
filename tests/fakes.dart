import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stars/api/dto/dtos.dart';

class FakeDioResponse extends Fake implements Response<dynamic> {}

class FakeUri extends Fake implements Uri {}

class FakeLaunchesListDto extends Fake implements LaunchesListDto {}

class FakeLaunchDto extends Fake implements LaunchDto {}
