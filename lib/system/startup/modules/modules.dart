import 'dart:async';

import 'package:dio/dio.dart';
import 'package:stars/api/api.dart';
import 'package:stars/api/dio/api.dart';
import 'package:stars/api/dio/transformer.dart';
import 'package:stars/api/environment.dart';
import 'package:stars/extensions/extensions.dart';
import 'package:stars/system/startup/graph.dart';
import 'package:stars/system/startup/modules/base.dart';

const modules = <Module<dynamic>>[
  InternalRestModule(),
  EnvironmentModule(),
  TimeDilationModule(),
  ApiModule(),
];

class ApiModule extends Module<Api> {
  const ApiModule();

  @override
  Future<void> doInject(
    final Api value,
    final GraphBuilder builder,
  ) async =>
      builder.api = value;

  @override
  Future<ApiImpl> doInitialize(GraphBuilder builder) async {
    return ApiImpl(
      builder.externalDio.liftNonNull,
      builder.environment.liftNonNull,
    );
  }
}

class InternalRestModule extends Module<Dio> {
  const InternalRestModule();

  @override
  Future<Dio> doInitialize(
    final GraphBuilder builder,
  ) async {
    return Dio(BaseOptions(validateStatus: (final _) => true))
      ..transformer = DioTransformer()
      ..interceptors.add(LogInterceptor())
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            final RequestOptions options,
            final RequestInterceptorHandler handler,
          ) =>
              handler.next(ListNormalizerOptions.create(options)),
        ),
      );
  }

  @override
  Future<void> doInject(final Dio value, final GraphBuilder builder) async =>
      builder.internalDio = value;
}

class EnvironmentModule extends Module<Environment> {
  const EnvironmentModule();

  @override
  Future<Environment> doInitialize(
    final GraphBuilder builder,
  ) async =>
      builder.environment.liftNonNull;

  @override
  Future<void> doInject(
    final Environment value,
    final GraphBuilder builder,
  ) async =>
      builder.environment = value;
}

class TimeDilationModule extends Module<double> {
  const TimeDilationModule([this.dilation = 1.0]) : assert(dilation > 0);

  final double dilation;

  @override
  Future<double> doInitialize(
    final GraphBuilder builder,
  ) async =>
      dilation;

  @override
  Future<void> doInject(final double value, final GraphBuilder builder) async {
    builder.timeDilation = value;
  }
}
