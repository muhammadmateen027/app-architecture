import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/api_assertion.dart';
import 'package:stars/api/dio/api.dart';
import 'package:stars/api/dto/dtos.dart';
import 'package:stars/api/environment.dart';
import 'package:test/test.dart';

import '../fakes.dart';
import 'dio/dio_response_models.dart';

void main() {
  late Api api;
  late Dio dio;
  late MockApiAssertions assertions;
  late _ArrangeBuilder builder;
  late Environment environment;

  setUpAll(() {
    registerFallbackValue(FakeDioResponse());
    registerFallbackValue(FakeUri());
  });

  setUp(
    () {
      environment = Environment.staging;
      dio = MockDio();
      assertions = MockApiAssertions();
      api = ApiImpl(dio, environment, assertions);

      builder = _ArrangeBuilder(dio, assertions: assertions);
    },
  );

  test('get all the launches list', () async {
    builder.withSuccessfulGetResponse(
      DioResponseModels.launchesResponse(),
    );

    final result = await api.launches();

    expect(result, isA<List<LaunchDto>>());
  });

  test('throws http exception if response is invalid', () async {
    builder
      ..withFailedGetResponse(400)
      ..withResponseAssertThrows();

    expect(
      () async => api.launches(),
      throwsA(isA<HttpException>()),
    );
  });
}

class _ArrangeBuilder {
  _ArrangeBuilder(
    this.dio, {
    final ApiAssertions? assertions,
  }) : _assertions = assertions ?? MockApiAssertions() {
    withResponseAssertSuccess();
  }

  final Dio dio;
  final ApiAssertions _assertions;

  void withResponseAssertSuccess() {
    when(() => _assertions.assertResponse(any())).thenAnswer((final _) => {});
  }

  void withFailedGetResponse(final int status, [final ResponseData? data]) {
    when(() => dio.getUri<ResponseData>(any())).thenAnswer(
      (final _) async => Response<ResponseData>(
        requestOptions: RequestOptions(path: 'any'),
        data: data,
        extra: {},
        statusCode: status,
      ),
    );
  }

  void withResponseAssertThrows() {
    when(() => _assertions.assertResponse(any())).thenThrow(
      const HttpException('Invalid response'),
    );
  }

  void withSuccessfulGetResponse(
    final ResponseData data, {
    final String? url,
  }) {
    when(() => dio.getUri<ResponseData>(url != null ? Uri.parse(url) : any()))
        .thenAnswer(
      (final _) async => Response<ResponseData>(
        requestOptions: RequestOptions(path: 'any'),
        data: data,
        extra: {},
        statusCode: 200,
      ),
    );
  }
}

class MockDio extends Mock implements Dio {}

class MockApiAssertions extends Mock implements ApiAssertions {}
