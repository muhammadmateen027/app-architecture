import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class DioTransformer extends DefaultTransformer {
  @override
  Future<dynamic> transformResponse(
    RequestOptions options,
    ResponseBody response,
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
