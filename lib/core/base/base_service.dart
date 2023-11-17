import '../../products/models/auth_model/request_token_model.dart';
import '../../products/models/cast_model/movie_credit_cast_model.dart';
import '../../products/models/cast_model/series_credit_cast_model.dart';
import '../../products/models/movie_detail_model/movie_casts_model.dart';
import '../../products/models/movie_detail_model/movie_detail_model.dart';
import '../../products/models/movie_detail_model/movie_similar_model.dart';
import '../../products/models/movie_models/movie_genres_model.dart';
import '../../products/models/movie_models/now_playing_model.dart';
import '../../products/models/movie_models/popular_movie_model.dart';
import '../../products/models/movie_models/trend_movie_model.dart';
import '../../products/models/series_detail_model/series_cast_model.dart';
import '../../products/models/series_detail_model/series_detail_model.dart';
import '../../products/models/series_detail_model/series_similar_model.dart';
import '../../products/models/series_models/popular_series_model.dart';
import '../../products/models/series_models/top_rated_series_model.dart';
import '../../products/models/series_models/trends_series_model.dart';

abstract class BaseServiceMovie {
  Future<List<NowPlays>?> getNowPlayingMovies();
  Future<List<Populars>?> getPopularMovies();
  Future<List<Trends>?> getTrendingMovies();
  Future<List<Genres>?> getMovieGenres();
  Future<List<Populars>?> getMovieWithParam(String param);
  Future<MovieDetailModel?> getMovieDetailById(int movieId);
  Future<List<Cast>?> getMovieCastsById(int? id);
  Future<List<SimilarMovie>?> getMovieSimilarById(int? id);
  Future<List<MovieCreditCast>?> getMovieCreditCast(int? id);
}

abstract class BaseServiceSeries {
  Future<List<TopRateds>?> getTopRatedSeries();
  Future<List<PopularSeries>?> getPopularSeries();
  Future<List<TrendsSeries>?> getTrendingSeries();
  Future<List<Genres>?> getSeriesGenres();
  Future<SeriesDetailModel?> getSeriesDetailById(int movieId);
  Future<List<SeriesCast>?> getSeriesCastsById(int? id);
  Future<List<SimilarSeries>?> getSeriesSimilarById(int? id);
  Future<List<SeriesCreditCast>?> getSeriesCreditCast(int? id);
}

abstract class BaseAuthService {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel?> validateWithLogin(
      Map<String, dynamic> requestBody);
  Future<String> createSession(Map<String, dynamic> requestBody);
}
