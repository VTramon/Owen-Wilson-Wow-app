import 'dart:convert';

import 'package:http/http.dart';
import 'package:owen_wilson/models/api.dart';

import '../webclient_http.dart';

class WowWebclient {
  Future<List<dynamic>> oneRandom() async {
    final Response response = await client.get(baseUrl('random'));

    // debugPrint('response: ${response.body.toString()}');
    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);

      decodedJson.map((dynamic json) => Api.fromJson(json));

      // debugPrint('DecodedJson: ${decodedJson.toString()}');

      return decodedJson;
    } else {
      throw Exception('something is happening');
    }

    // final result =
    //     decodedJson.map((dynamic json) => Api.fromJson(json)).toList();

    // debugPrint('result: ${decodedJson.first.toString()}');
  }
}
