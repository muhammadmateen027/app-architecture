import 'dart:io';

import 'package:dio/dio.dart';

class ApiAssertions {
  const ApiAssertions();

  void assertResponse(Response<dynamic> response) {
    final code = response.statusCode;
    if (code != null && (_isFailedCode(code) || response.data == null)) {
      throw HttpException(
        'Invalid response ${response.statusCode} with ${response.data}',
      );
    }
  }

  bool _isFailedCode(int code) => code < 200 || code >= 400;
}
