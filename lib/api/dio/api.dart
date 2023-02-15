import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/api_assertion.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/api/environment.dart';

typedef DioResponseType = dynamic;
typedef ResponseData = Map<String, dynamic>;

@immutable
class ApiImpl implements Api {
  const ApiImpl(
    this.dio,
    this.environment,
    this.connectivity, [
    this.assertions = const ApiAssertions(),
  ]);

  final Dio dio;
  final Environment environment;
  final Connectivity connectivity;
  final ApiAssertions assertions;

  String get _hostname => 'https://${environment.domain}';

  @override
  Future<LaunchDto> getLaunch(String id) async {
    final url = '$_hostname/v4/launches/$id';

    final response = await dio.getUri<DioResponseType>(Uri.parse(url));

    assertions.assertResponse(response);

    return LaunchDto.fromJson(response.data as ResponseData);
  }

  @override
  Future<List<LaunchDto>> launches() async {
    final url = '$_hostname/v4/launches';

    final response = await dio.getUri<DioResponseType>(Uri.parse(url));

    assertions.assertResponse(response);
    final iterable = json.decode(response.data as String) as List;

    return List<LaunchDto>.from(
      iterable.map(
        (model) => LaunchDto.fromJson(model as ResponseData),
      ),
    );
  }
}
