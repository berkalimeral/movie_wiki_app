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
          'accept': 'application/json'
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

  static dynamic delete(String path, String? body) async {
    final response = await https.delete(
        Uri(
          scheme: 'https',
          host: ApiConstants.apiHost,
          path: path,
        ),
        body: {
          'session_id': body,
        },
        headers: {
          'Authorization': ApiConstants.apiReadAccessToken,
          'accept': 'application/json'
        });

    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    } else {
      log(
        'Something is wrong deleting data!',
      );
      return null;
    }
  }

  static dynamic getSearch(String path, String param) async {
    final response = await https.get(
        Uri(
            scheme: 'https',
            host: ApiConstants.apiHost,
            path: path,
            queryParameters: {
              'query': param,
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

  static dynamic post(String path,
      {required Map<dynamic, dynamic> param}) async {
    try {
      final response = await https.post(
          Uri(
            scheme: 'https',
            host: ApiConstants.apiHost,
            path: path,
          ),
          body: jsonEncode(param),
          headers: {
            'Authorization': ApiConstants.apiReadAccessToken,
            'content-type': 'application/json'
          });

      if (response.statusCode == HttpStatus.ok) {
        log(response.body);
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        log(
          'Something is wrong getting data!',
        );
        return null;
      }
    } catch (e) {
      log('Login Error: ${e.toString()}');
    }
  }
}
