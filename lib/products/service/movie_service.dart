import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as https;
import 'package:uni_society_app/products/models/movie_models/movie_genres_model.dart';
import 'package:uni_society_app/products/models/movie_models/now_playing_model.dart';

import '../../core/constants/api_const.dart';
import '../models/cast_model/movie_credit_cast_model.dart';
import '../models/movie_detail_model/movie_casts_model.dart';
import '../models/movie_detail_model/movie_detail_model.dart';
import '../models/movie_models/popular_movie_model.dart';
import '../models/movie_models/trend_movie_model.dart';
import '../models/movie_detail_model/movie_similar_model.dart';
import '../network/network_values.dart';

class MovieService {
  ///Get Now Playing Movies
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

  ///Get Popular Movies
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

  ///Get Trending Movie
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

  ///Get Movie Genres
  Future<List<MovieGenres>?> getMovieGenres() async {
    var response = await https.get(
        Uri(
            scheme: 'https',
            host: apiHost,
            path: EndPointsBoth.movieGenres,
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

  ///Get Movie Detail Service
  Future<MovieDetailModel?> getMovieDetailById(int movieId) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsMovie.movieDetail(movieId),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });

    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      MovieDetailModel movieDetail = MovieDetailModel.fromJson(responseBody);
      return movieDetail;
    } else {
      log(
        'Something is wrong in getMovieDetailById',
      );
      return null;
    }
  }

  ///Get Movie Casts
  Future<List<Cast>?> getMovieCastsById(int? id) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsMovie.actors(id),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      CastsModel casts = CastsModel.fromJson(responseBody);
      return casts.cast;
    } else {
      log(
        'Something is wrong in getMovieCastsById',
      );
      return null;
    }
  }

  ///Get Movie Casts
  Future<List<SimilarMovie>?> getMovieSimilarById(int? id) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsMovie.similar(id),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      SimilarModel similar = SimilarModel.fromJson(responseBody);
      return similar.results;
    } else {
      log(
        'Something is wrong in getMovieRecommendationById',
      );
      return null;
    }
  }

  ///Get Movie Credit
  Future<List<MovieCreditCast>?> getMovieCreditCast(int? id) async {
    var response = await https.get(
        Uri(
          scheme: 'https',
          host: apiHost,
          path: EndPointsMovie.credits(id),
          queryParameters: {
            'language': 'tr-TR',
          },
        ),
        headers: {
          'Authorization': apiReadAccessToken,
        });
    if (response.statusCode == HttpStatus.ok) {
      var responseBody = jsonDecode(response.body);
      MovieCreditsModel credit = MovieCreditsModel.fromJson(responseBody);
      return credit.cast;
    } else {
      log(
        'Something is wrong in getMovieCreditCast',
      );
      return null;
    }
  }
}
