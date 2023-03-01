import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/api_assertion.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/api/environment.dart';

typedef ResponseData = dynamic;

@immutable
class ApiImpl implements Api {
  const ApiImpl(
    this.dio,
    this.environment, [
    this.assertions = const ApiAssertions(),
  ]);

  final Dio dio;
  final ApiAssertions assertions;
  final Environment environment;

  String get _hostname => 'https://${environment.domain}';

  @override
  Future<LaunchDto> getLaunch(String id) async {
    final url = '$_hostname/v4/launches/$id';

    final response = await dio.getUri<ResponseData>(url.toUri);

    assertions.assertResponse(response);
    return LaunchDto.fromJson(response.data);
  }

  @override
  Future<List<LaunchDto>> launches() async {
    final url = '$_hostname/v4/launches';
    final response = await dio.getUri<ResponseData>(url.toUri);

    assertions.assertResponse(response);

    return compute(_buildLaunchList, response.data ?? <dynamic>[]);
  }
}

List<LaunchDto> _buildLaunchList(ResponseData jsonData) {
  return (jsonData! as Iterable)
      // ignore: unnecessary_lambdas
      .map((final e) => LaunchDto.fromJson(e))
      .toList();
}

extension URL on String {
  Uri get toUri => Uri.parse(this);
}
