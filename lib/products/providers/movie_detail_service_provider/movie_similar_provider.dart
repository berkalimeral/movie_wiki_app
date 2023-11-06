import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie_detail_model/movie_similar_model.dart';
import '../../service/movie_service.dart';

final movieSimilarProvider =
    StateNotifierProvider<MovieSimilarProvider, List<SimilarMovie>?>(
        (ref) => MovieSimilarProvider(MovieService()));

class MovieSimilarProvider extends StateNotifier<List<SimilarMovie>?> {
  MovieSimilarProvider(this._service) : super(null);

  final MovieService _service;

  Future<List<SimilarMovie>?> getMovieSimilarById(int? movieId) async {
    state = await _service.getMovieSimilarById(movieId);
    return state;
  }
}
