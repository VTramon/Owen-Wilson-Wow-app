import 'dart:convert';

import 'package:http/http.dart';
import 'package:owen_wilson/http/webclient_http.dart';
import 'package:owen_wilson/models/api.dart';

class WowWebclient {
  List<Api> parseRandom(Response response) {
    final List<dynamic> parsed = jsonDecode(response.body);

    final List<Api> result = parsed.map((json) {
      return Api.fromJson(json);
    }).toList();

    return result;
  }

  Future<List<Api>> random({String? resultsLength}) async {
    await Future.delayed(const Duration(seconds: 2));
    final Response response =
        await client.get(baseUrl(path: 'random', resultsLength: resultsLength));

    if (response.statusCode == 200) {
      return parseRandom(response);
    } else {
      throw HttpException(_getMessage(response.statusCode));
    }
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode]!;
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'Bad request',
    404: 'Not found',
    408: 'request timeout',
    500: 'Internal server error',
  };
}

class HttpException implements Exception {
  final String message;

  const HttpException(this.message);
}
