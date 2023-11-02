import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as https;

import '../../core/constants/api_const.dart';

import '../models/series_models/popular_series_model.dart';
import '../models/series_models/series_gender_model.dart';
import '../models/series_models/top_rated_series_model.dart';
import '../models/series_models/trends_series_model.dart';
import '../network/network_values.dart';

class SeriesService {
  Future<List<TopRateds>?> getTopRatedSeries() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsMovie.nowPlaying,
            queryParameters: {
              'language': 'tr-TR',
              'page': '1',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      TopRatedSeriesModel nowPlaying =
          TopRatedSeriesModel.fromJson(responseBody);
      return nowPlaying.results;
    } else {
      log(
        'Something is wrong in getTopRatedSeries',
      );
      return null;
    }
  }

  Future<List<PopularSeries>?> getPopularSeries() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsSeries.popular,
            queryParameters: {
              'language': 'tr-TR',
              'page': '1',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      PopularSeriesModel popular = PopularSeriesModel.fromJson(responseBody);
      return popular.results;
    } else {
      log(
        'Something is wrong in getPopularSeries',
      );
      return null;
    }
  }

  Future<List<TrendsSeries>?> getTrendingSeries() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsSeries.trending,
            queryParameters: {
              'language': 'tr-TR',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      TrendsSeriesModel trending = TrendsSeriesModel.fromJson(responseBody);
      return trending.results;
    } else {
      log(
        'Something is wrong in getTrendingSeries',
      );
      return null;
    }
  }

  Future<List<SeriesGenres>?> getSeriesGenres() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsGenres.seriesGenres,
            queryParameters: {
              'language': 'tr',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });

    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      SeriesGenresModel seriesGenres = SeriesGenresModel.fromJson(responseBody);
      return seriesGenres.genres;
    } else {
      log(
        'Something is wrong in getMovieGenres',
      );
      return null;
    }
  }
}
