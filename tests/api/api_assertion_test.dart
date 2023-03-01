import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stars/api/api_assertion.dart';
import 'package:test/test.dart';

typedef _ResponseData = Map<String, dynamic>;

void main() {
  test(
    'throw http exception if code is less than 200',
    () async {
      expect(
        () => const ApiAssertions().assertResponse(
          Response(
            requestOptions: RequestOptions(path: 'any'),
            data: _ResponseData,
            extra: {},
            statusCode: 199,
          ),
        ),
        throwsA(isA<HttpException>()),
      );
    },
  );

  test(
    'throw http exception if code is grater or equal 400',
    () async {
      expect(
        () => const ApiAssertions().assertResponse(
          Response(
            requestOptions: RequestOptions(path: 'any'),
            data: _ResponseData,
            extra: {},
            statusCode: 400,
          ),
        ),
        throwsA(isA<HttpException>()),
      );
    },
  );

  test(
    'do not throw anything with correct code and data which is not null',
    () async {
      const ApiAssertions().assertResponse(
        Response(
          requestOptions: RequestOptions(path: 'any'),
          data: _ResponseData,
          extra: {},
          statusCode: 200,
        ),
      );
    },
  );

  test(
    'throw http exception if response data is null',
    () async {
      expect(
        () => const ApiAssertions().assertResponse(
          Response(
            requestOptions: RequestOptions(path: 'any'),
            // ignore: avoid_redundant_argument_values
            data: null,
            extra: {},
            statusCode: 200,
          ),
        ),
        throwsA(isA<HttpException>()),
      );
    },
  );
}
