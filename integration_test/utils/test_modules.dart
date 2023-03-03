import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/modules/base.dart';
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

class EnvironmentTestModule extends Module<Environment> {
  const EnvironmentTestModule();

  @override
  Future<Environment> doInitialize(final GraphBuilder builder) async =>
      Environment.testing;

  @override
  Future<void> doInject(
    final Environment value,
    final GraphBuilder builder,
  ) async =>
      builder.environment = value;
}

class TimeDilationTestModule extends TimeDilationModule {
  const TimeDilationTestModule([
    final double dilation = 0.01,
  ]) : super(dilation);
}

extension ModuleReplacement on List<Module<dynamic>> {
  List<Module<dynamic>> replace({
    required final Type moduleType,
    required final Module<dynamic> replacement,
  }) {
    final newModules = List.of(this);
    for (var i = 0; i < length; i++) {
      if (this[i].runtimeType == moduleType) {
        newModules
          ..insert(i + 1, replacement)
          ..removeAt(i);

        break;
      }
    }

    return newModules;
  }
}
