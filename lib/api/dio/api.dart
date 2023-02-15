import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/api_assertion.dart';

typedef DioResponseType = dynamic;

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

  String get _versionOne => 'v4';

  @override
  Future<void> getLaunch(String id) async {
    final url = '$_hostname/$_versionOne/launches/$id';

    final response = await dio.getUri<DioResponseType>(Uri.parse(url));

    assertions.assertResponse(response);

    // TODO: return dto
    // return UserStatusResponseDto.fromJson(response.data!);
  }

  @override
  Future<void> launches() async {
    await assertions.assertOnline(connectivity);

    final url = '$_hostname/$_versionOne/launches';

    final response = await dio.getUri<DioResponseType>(Uri.parse(url));

    assertions.assertResponse(response);

    // TODO: return dto
    // return UserStatusResponseDto.fromJson(response.data!);
  }
}
