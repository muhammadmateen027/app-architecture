import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/modules/modules.dart';

import '../stub/responder.dart';
import '../stub/stub_adapter.dart';

class InternalRestTestModule extends InternalRestModule {
  const InternalRestTestModule(this.responder);

  final StubResponder responder;

  @override
  Future<Dio> doInitialize(
    final GraphBuilder builder,
  ) async {
    final dio = await super.doInitialize(builder);

    return dio
      ..interceptors.add(InterceptorsWrapper(onError: _errorLogger))
      ..httpClientAdapter = StubHttpClientAdapter(responder);
  }

  void _errorLogger(final DioError e, final ErrorInterceptorHandler handler) {
    if (e.response != null) {
      log(
        'Http Error: ${e.requestOptions.uri} ${e.response?.statusCode}',
        error: e.error,
      );
    } else {
      log(
        'Http Error: ${e.requestOptions.uri} ${e.error}',
        error: e.error,
      );
    }

    handler.next(e);
  }
}
