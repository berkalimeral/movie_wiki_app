import '../../core/base/api_client.dart';
import '../../core/base/base_service.dart';

import '../models/cast_model/series_credit_cast_model.dart';
import '../models/series_detail_model/series_cast_model.dart';
import '../models/series_detail_model/series_detail_model.dart';
import '../models/series_detail_model/series_similar_model.dart';
import '../models/series_models/popular_series_model.dart';
import '../models/series_models/series_gender_model.dart';
import '../models/series_models/top_rated_series_model.dart';
import '../models/series_models/trends_series_model.dart';
import '../network/network_values.dart';

class SeriesService extends BaseServiceSeries {
  ///Get Series Top Rated Service
  @override
  Future<List<TopRateds>?> getTopRatedSeries() async {
    final responseBody = await ApiClient.get(EndPointsSeries.topRated);
    TopRatedSeriesModel nowPlaying = TopRatedSeriesModel.fromJson(responseBody);
    return nowPlaying.results;
  }

  ///Get Series Popular Service
  @override
  Future<List<PopularSeries>?> getPopularSeries() async {
    final responseBody = await ApiClient.get(EndPointsSeries.popular);
    PopularSeriesModel popular = PopularSeriesModel.fromJson(responseBody);
    return popular.results;
  }

  ///Get Series Trending Service
  @override
  Future<List<TrendsSeries>?> getTrendingSeries() async {
    final responseBody = await ApiClient.get(EndPointsSeries.trending);
    TrendsSeriesModel trending = TrendsSeriesModel.fromJson(responseBody);
    return trending.results;
  }

  ///Get Series Genres Service
  @override
  Future<List<SeriesGenres>?> getSeriesGenres() async {
    final responseBody = await ApiClient.get(EndPointsBoth.seriesGenres);
    SeriesGenresModel seriesGenres = SeriesGenresModel.fromJson(responseBody);
    return seriesGenres.genres;
  }

  ///Get Series Detail Service
  @override
  Future<SeriesDetailModel?> getSeriesDetailById(int movieId) async {
    final responseBody =
        await ApiClient.get(EndPointsSeries.seriesDetail(movieId));
    SeriesDetailModel seriesDetail = SeriesDetailModel.fromJson(responseBody);
    return seriesDetail;
  }

  ///Get Series Casts
  @override
  Future<List<SeriesCast>?> getSeriesCastsById(int? id) async {
    final responseBody = await ApiClient.get(EndPointsSeries.actors(id));
    SeriesCastModel seriesCasts = SeriesCastModel.fromJson(responseBody);
    return seriesCasts.cast;
  }

  ///Get Series Similar
  @override
  Future<List<SimilarSeries>?> getSeriesSimilarById(int? id) async {
    final responseBody = await ApiClient.get(EndPointsSeries.similar(id));
    SeriesSimilarModel similar = SeriesSimilarModel.fromJson(responseBody);
    return similar.results;
  }

  ///Get Series Credit
  @override
  Future<List<SeriesCreditCast>?> getSeriesCreditCast(int? id) async {
    final responseBody = await ApiClient.get(EndPointsSeries.credit(id));
    SeriesCreditsModel credit = SeriesCreditsModel.fromJson(responseBody);
    return credit.cast;
  }
}
