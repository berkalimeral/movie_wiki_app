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
import '../../products/models/series_models/series_gender_model.dart';
import '../../products/models/series_models/top_rated_series_model.dart';
import '../../products/models/series_models/trends_series_model.dart';

abstract class BaseServiceMovie {
  Future<List<NowPlays>?> getNowPlayingMovies();
  Future<List<Populars>?> getPopularMovies();
  Future<List<Trends>?> getTrendingMovies();
  Future<List<MovieGenres>?> getMovieGenres();
  Future<MovieDetailModel?> getMovieDetailById(int movieId);
  Future<List<Cast>?> getMovieCastsById(int? id);
  Future<List<SimilarMovie>?> getMovieSimilarById(int? id);
  Future<List<MovieCreditCast>?> getMovieCreditCast(int? id);
}

abstract class BaseServiceSeries {
  Future<List<TopRateds>?> getTopRatedSeries();
  Future<List<PopularSeries>?> getPopularSeries();
  Future<List<TrendsSeries>?> getTrendingSeries();
  Future<List<SeriesGenres>?> getSeriesGenres();
  Future<SeriesDetailModel?> getSeriesDetailById(int movieId);
  Future<List<SeriesCast>?> getSeriesCastsById(int? id);
  Future<List<SimilarSeries>?> getSeriesSimilarById(int? id);
  Future<List<SeriesCreditCast>?> getSeriesCreditCast(int? id);
}
