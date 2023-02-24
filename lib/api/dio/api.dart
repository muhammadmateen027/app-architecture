import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/api_assertion.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/api/environment.dart';

typedef DioResponseType = dynamic;
typedef ResponseData = Map<String, dynamic>;
typedef ListResponseData = List<dynamic>;

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

    final response = await dio.getUri<DioResponseType>(url.toUri);

    assertions.assertResponse(response);
    return LaunchDto.fromJson(response.data as ResponseData);
  }

  @override
  Future<LaunchesList> launches() async {
    final url = '$_hostname/v4/launches';
    final response = await dio.getUri<DioResponseType>(url.toUri);

    assertions.assertResponse(response);
    return compute(_buildLaunchList, response.data as ListResponseData);
  }
}

LaunchesList _buildLaunchList(List<dynamic> jsonData) {
  return LaunchesList.fromJson(jsonData);
}

extension URL on String {
  Uri get toUri => Uri.parse(this);
}
