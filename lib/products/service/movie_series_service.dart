import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as https;
import 'package:uni_society_app/core/constants/api_const.dart';
import 'package:uni_society_app/products/network/network_values.dart';

import '../models/cast_model/cast_model.dart';

class MovieSeriesService {
  Future<CastModel?> getCastsById(int? id) async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsBoth.casts(id),
            queryParameters: {
              'language': 'tr-TR',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      return CastModel.fromJson(responseBody);
    } else {
      log(
        'Something is wrong in getCastsById',
      );
      return null;
    }
  }
}
