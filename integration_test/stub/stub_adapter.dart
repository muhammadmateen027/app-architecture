import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'responder.dart';

class StubHttpClientAdapter implements HttpClientAdapter {
  StubHttpClientAdapter(this.responder);

  final StubResponder responder;

  @override
  Future<ResponseBody> fetch(
    final RequestOptions options,
    final Stream<Uint8List>? requestStream,
    final Future<dynamic>? cancelFuture,
  ) async {
    final request = Request(
      uri: options.uri,
      method: options.method,
      headers: options.headers,
    );

    // ignore: invalid_use_of_visible_for_testing_member
    final response = await responder.respond(request);

    // ignore: prefer-conditional-expressions
    if (response.body is String) {
      return ResponseBody.fromString(
        response.body.toString(),
        response.statusCode,
        headers: (response.headers ?? <String, String>{}).map(
          (final key, final value) => MapEntry(key, [value]),
        ),
      );
    } else if (response.body is List<int>) {
      return ResponseBody.fromBytes(
        response.body as List<int>,
        response.statusCode,
        headers: (response.headers ?? <String, String>{}).map(
          (final key, final value) => MapEntry(key, [value]),
        ),
      );
    }
    throw Exception('Response is not parsable');
  }

  @override
  void close({final bool force = false}) {}
}
