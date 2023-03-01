import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stars/api/dto/dtos.dart';

// ignore_for_file: avoid_implementing_value_types
class FakeDioResponse extends Fake implements Response<dynamic> {}

class FakeUri extends Fake implements Uri {}

class FakeLaunchesListDto extends Fake implements LaunchesListDto {}

class FakeLaunchDto extends Fake implements LaunchDto {}
