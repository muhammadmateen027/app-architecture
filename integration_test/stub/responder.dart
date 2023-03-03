import 'dart:async';

class LocalResponse {
  LocalResponse(
    this.body, {
    required this.statusCode,
    this.headers,
  });

  factory LocalResponse.success(
    final dynamic body, {
    final Map<String, String>? headers,
  }) =>
      LocalResponse(body, statusCode: 200, headers: headers);

  final Object body;
  final int statusCode;
  final Map<String, String>? headers;
}

class Request {
  Request({
    required this.uri,
    required this.method,
    this.headers,
  });

  final Uri uri;
  final String method;
  final Map<String, dynamic>? headers;
}

// ignore: one_member_abstracts
abstract class StubResponder {
  Future<LocalResponse> respond(final Request request);
}
