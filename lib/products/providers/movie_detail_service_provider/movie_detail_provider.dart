import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie_detail_model/movie_detail_model.dart';
import '../../service/movie_service.dart';

final movieDetailProvider =
    StateNotifierProvider<MovieDetailProvider, MovieDetailModel?>(
        (ref) => MovieDetailProvider(MovieService()));

class MovieDetailProvider extends StateNotifier<MovieDetailModel?> {
  MovieDetailProvider(this._service) : super(null);

  final MovieService _service;

  Future<MovieDetailModel?> getMovieDetail(int movieId) async {
    state = await _service.getMovieDetailById(movieId);
    return state;
  }
}
