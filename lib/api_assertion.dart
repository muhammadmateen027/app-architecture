import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

//TODO: check connectivity with extension
import 'package:stars/api/network_exceptions.dart';

class ApiAssertions {
  const ApiAssertions();

  Future<void> assertOnline(final Connectivity connectivity) async {
    //TODO: check connectivity with extension
    // if (!await connectivity.checkConnectivity()) {
    //   throw const OfflineException();
    // }
  }

  void assertResponse(final Response<dynamic> response) {
    final code = response.statusCode;
    if (code != null && (_isFailedCode(code) || response.data == null)) {
      throw HttpException(
        'Invalid response ${response.statusCode} with ${response.data}',
      );
    }
  }

  bool _isFailedCode(final int code) => code < 200 || code >= 400;
}
