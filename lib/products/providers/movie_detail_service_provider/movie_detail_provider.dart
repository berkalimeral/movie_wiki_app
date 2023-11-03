import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/products/service/movie_service.dart';

import '../../models/movie_detail_model/movie_detail_model.dart';

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
