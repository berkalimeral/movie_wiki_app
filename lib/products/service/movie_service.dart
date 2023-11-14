import '../../core/base/api_client.dart';
import '../../core/base/base_service.dart';
import '../models/cast_model/movie_credit_cast_model.dart';
import '../models/movie_detail_model/movie_casts_model.dart';
import '../models/movie_detail_model/movie_detail_model.dart';
import '../models/movie_models/movie_genres_model.dart';
import '../models/movie_models/now_playing_model.dart';
import '../models/movie_models/popular_movie_model.dart';
import '../models/movie_models/trend_movie_model.dart';
import '../models/movie_detail_model/movie_similar_model.dart';
import '../network/network_values.dart';

class MovieService extends BaseServiceMovie {
  ///Get Now Playing Movies
  @override
  Future<List<NowPlays>?> getNowPlayingMovies() async {
    final responseBody = await ApiClient.get(EndPointsMovie.nowPlaying);
    NowPlayingModel nowPlaying = NowPlayingModel.fromJson(responseBody);
    return nowPlaying.results;
  }

  ///Get Popular Movies
  @override
  Future<List<Populars>?> getPopularMovies() async {
    final responseBody = await ApiClient.get(EndPointsMovie.popular);
    PopularMovieModel popular = PopularMovieModel.fromJson(responseBody);
    return popular.results;
  }

  ///Get Trending Movie
  @override
  Future<List<Trends>?> getTrendingMovies() async {
    final responseBody = await ApiClient.get(EndPointsMovie.trending);
    TrendMovieModel trending = TrendMovieModel.fromJson(responseBody);
    return trending.results;
  }

  ///Get Movie Genres
  @override
  Future<List<Genres>?> getMovieGenres() async {
    final responseBody = await ApiClient.get(EndPointsBoth.movieGenres);
    MovieGenresModel movieGenres = MovieGenresModel.fromJson(responseBody);
    return movieGenres.genres;
  }

  ///Get Movie Detail Service
  @override
  Future<MovieDetailModel?> getMovieDetailById(int movieId) async {
    final responseBody =
        await ApiClient.get(EndPointsMovie.movieDetail(movieId));
    MovieDetailModel movieDetail = MovieDetailModel.fromJson(responseBody);
    return movieDetail;
  }

  ///Get Movie Casts
  @override
  Future<List<Cast>?> getMovieCastsById(int? id) async {
    final responseBody = await ApiClient.get(EndPointsMovie.actors(id));
    CastsModel casts = CastsModel.fromJson(responseBody);
    return casts.cast;
  }

  ///Get Movie Casts
  @override
  Future<List<SimilarMovie>?> getMovieSimilarById(int? id) async {
    final responseBody = await ApiClient.get(EndPointsMovie.similar(id));
    SimilarModel similar = SimilarModel.fromJson(responseBody);
    return similar.results;
  }

  ///Get Movie Credit
  @override
  Future<List<MovieCreditCast>?> getMovieCreditCast(int? id) async {
    final responseBody = await ApiClient.get(EndPointsMovie.credits(id));
    MovieCreditsModel credit = MovieCreditsModel.fromJson(responseBody);
    return credit.cast;
  }
}
