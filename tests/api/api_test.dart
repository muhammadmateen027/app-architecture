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
import '../mocktails.dart';
import 'dio/dio_models.dart';

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
    builder.withSuccessfulGetResponse<ListResponseData>(
      DioModels.launchesResponse(),
    );

    final result = await api.launches();

    expect(result, isA<LaunchesListDto>());
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

  void withFailedGetResponse(final int status, [final DioResponseType data]) {
    when(() => dio.getUri<DioResponseType>(any())).thenAnswer(
      (final _) async => Response<DioResponseType>(
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

  void withSuccessfulGetResponse<T>(
    final T data, {
    final String? url,
  }) {
    when(() => dio.getUri<T>(url != null ? Uri.parse(url) : any())).thenAnswer(
      (final _) async => Response<T>(
        requestOptions: RequestOptions(path: 'any'),
        data: data,
        extra: {},
        statusCode: 200,
      ),
    );
  }
}
