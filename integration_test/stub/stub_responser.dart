import 'responder.dart';

class StubResponderImpl extends StubResponder {
  @override
  Future<LocalResponse> respond(Request request) async {
    try {
      switch(request.uri.path) {
        // case
      }
    } on LocalResponse catch (r) {
      return r;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // ignore: avoid_print
      print('Unable to load response $e');

      return LocalResponse(
        e.toString(),
        statusCode: 500,
      );
    }

    return LocalResponse(
      '{"error": "Not found ${request.uri}"}',
      statusCode: 404,
      headers: {'content-type': 'application/hal+json;charset=UTF-8'},
    );
  }
}
