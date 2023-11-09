import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as https;

import '../constants/api_const.dart';

class ApiClient {
  static dynamic get(String path) async {
    final response = await https.get(
        Uri(
            scheme: 'https',
            host: ApiConstants.apiHost,
            path: path,
            queryParameters: {
              'language': 'tr-TR',
              'page': '1',
            }),
        headers: {
          'Authorization': ApiConstants.apiReadAccessToken,
        });

    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } else {
      log(
        'Something is wrong getting data!',
      );
      return null;
    }
  }
}
