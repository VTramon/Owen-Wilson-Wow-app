import 'dart:convert';

import 'package:http/http.dart';
import 'package:owen_wilson/models/api.dart';

import '../webclient_http.dart';

class WowWebclient {
  Future<List<Api>> random({String? resultsLength}) async {
    final Response response =
        await client.get(baseUrl(path: 'random', resultsLength: resultsLength));
    // debugPrint(
    //     baseUrl(path: 'random', resultsLength: resultsLength).toString());
    // debugPrint(parseRandom(response).length.toString());
    if (response.statusCode == 200) {
      return parseRandom(response);
    } else {
      throw Exception('something is wrong');
    }
  }

  List<Api> parseRandom(Response response) {
    final List<dynamic> parsed = jsonDecode(response.body);

    final List<Api> result = parsed.map((json) {
      // debugPrint(Api.fromJson(json).toString());
      return Api.fromJson(json);
    }).toList();

    return result;
  }
}
