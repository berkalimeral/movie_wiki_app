import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as https;
import 'package:uni_society_app/products/models/movie_genres_model.dart';
import 'package:uni_society_app/products/models/now_playing_model.dart';

import '../../core/constants/api_const.dart';
import '../models/popular_movie_model.dart';
import '../models/trend_movie_model.dart';
import '../network/network_values.dart';

class MovieService {
  Future<List<NowPlays>?> getNowPlayingMovies() async {
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
      NowPlayingModel nowPlaying = NowPlayingModel.fromJson(responseBody);
      return nowPlaying.results;
    } else {
      log(
        'Something is wrong in getNowPlaying',
      );
      return null;
    }
  }

  Future<List<Populars>?> getPopularMovies() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsMovie.popular,
            queryParameters: {
              'language': 'tr-TR',
              'page': '1',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      PopularMovieModel popular = PopularMovieModel.fromJson(responseBody);
      return popular.results;
    } else {
      log(
        'Something is wrong in getPopularMovies',
      );
      return null;
    }
  }

  Future<List<Trends>?> getTrendingMovies() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsMovie.trending,
            queryParameters: {
              'language': 'tr-TR',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      TrendMovieModel trending = TrendMovieModel.fromJson(responseBody);
      return trending.results;
    } else {
      log(
        'Something is wrong in getTrendingMovies',
      );
      return null;
    }
  }

  Future<List<Genres>?> getMovieGenres() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsGenres.movieGenres,
            queryParameters: {
              'language': 'tr',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });

    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      MovieGenresModel movieGenres = MovieGenresModel.fromJson(responseBody);
      return movieGenres.genres;
    } else {
      log(
        'Something is wrong in getMovieGenres',
      );
      return null;
    }
  }
}
