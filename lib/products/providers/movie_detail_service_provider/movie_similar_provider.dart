import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie_detail_model/movie_similar_model.dart';
import '../../service/movie_service.dart';

final movieRecommendationProvider =
    StateNotifierProvider<MovieRecommendationProvider, List<SimilarMovie>?>(
        (ref) => MovieRecommendationProvider(MovieService()));

class MovieRecommendationProvider extends StateNotifier<List<SimilarMovie>?> {
  MovieRecommendationProvider(this._service) : super(null);

  final MovieService _service;

  Future<List<SimilarMovie>?> getMovieSimilarById(int? movieId) async {
    state = await _service.getMovieSimilarById(movieId);
    return state;
  }
}
