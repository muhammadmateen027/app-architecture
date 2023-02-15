import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class DioTransformer extends DefaultTransformer {
  @override
  Future<dynamic> transformResponse(
    final RequestOptions options,
    final ResponseBody response,
  ) async {
    final responseBody = super.transformResponse(options, response);

    if (options.responseType == ResponseType.json) {
      var body = await responseBody;
      if (body is String) {
        if (body.isEmpty) {
          body = '{}';
        }

        return json.decode(body);
      }
    }

    return responseBody;
  }
}

class ListNormalizerOptions extends RequestOptions {
  ListNormalizerOptions({
    required super.method,
    required super.sendTimeout,
    required super.receiveTimeout,
    required super.connectTimeout,
    required super.data,
    required super.path,
    required super.queryParameters,
    required super.baseUrl,
    required super.extra,
    required super.headers,
    required super.responseType,
    required super.contentType,
    required super.validateStatus,
    required super.receiveDataWhenStatusError,
    required super.followRedirects,
    required super.maxRedirects,
    required super.requestEncoder,
    required super.responseDecoder,
    required super.onReceiveProgress,
    required super.onSendProgress,
    required super.cancelToken,
  });

  factory ListNormalizerOptions.create(final RequestOptions options) {
    return ListNormalizerOptions(
      method: options.method,
      sendTimeout: options.sendTimeout,
      receiveTimeout: options.receiveTimeout,
      connectTimeout: options.connectTimeout,
      data: options.data,
      path: options.path,
      queryParameters: options.queryParameters,
      baseUrl: options.baseUrl,
      onReceiveProgress: options.onReceiveProgress,
      onSendProgress: options.onSendProgress,
      cancelToken: options.cancelToken,
      extra: options.extra,
      headers: options.headers,
      responseType: options.responseType,
      contentType: null,
      validateStatus: options.validateStatus,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
      followRedirects: options.followRedirects,
      maxRedirects: options.maxRedirects,
      requestEncoder: options.requestEncoder,
      responseDecoder: options.responseDecoder,
    );
  }

  @override
  Uri get uri => Uri.parse(super.uri.toString().replaceAll('%5B%5D', ''));
}
