import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as https;

import '../../core/constants/api_const.dart';

import '../models/cast_model/series_credit_cast_model.dart';
import '../models/series_detail_model/series_cast_model.dart';
import '../models/series_detail_model/series_detail_model.dart';
import '../models/series_detail_model/series_similar_model.dart';
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
            path: EndPointsSeries.topRated,
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
            path: EndPointsBoth.seriesGenres,
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

  ///Get Series Detail Service
  Future<SeriesDetailModel?> getSeriesDetailById(int movieId) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsSeries.seriesDetail(movieId),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });

    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      SeriesDetailModel seriesDetail = SeriesDetailModel.fromJson(responseBody);
      return seriesDetail;
    } else {
      log(
        'Something is wrong in getSeriesDetailById',
      );
      return null;
    }
  }

  ///Get Series Casts
  Future<List<SeriesCast>?> getSeriesCastsById(int? id) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsSeries.actors(id),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      SeriesCastModel seriesCasts = SeriesCastModel.fromJson(responseBody);
      return seriesCasts.cast;
    } else {
      log(
        'Something is wrong in getSeriesCastsById',
      );
      return null;
    }
  }

  ///Get Series Similar
  Future<List<SimilarSeries>?> getSeriesSimilarById(int? id) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsSeries.similar(id),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      SeriesSimilarModel similar = SeriesSimilarModel.fromJson(responseBody);
      return similar.results;
    } else {
      log(
        'Something is wrong in getSeriesSimilarById',
      );
      return null;
    }
  }

  ///Get Series Credit
  Future<List<SeriesCreditCast>?> getSeriesCreditCast(int? id) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsSeries.credit(id),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      SeriesCreditsModel credit = SeriesCreditsModel.fromJson(responseBody);
      return credit.cast;
    } else {
      log(
        'Something is wrong in getSeriesCreditCast',
      );
      return null;
    }
  }
}
