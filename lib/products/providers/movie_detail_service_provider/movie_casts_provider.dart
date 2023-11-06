import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie_detail_model/movie_casts_model.dart';
import '../../service/movie_service.dart';

final movieCastProvider = StateNotifierProvider<MovieCastProvider, List<Cast>?>(
    (ref) => MovieCastProvider(MovieService()));

class MovieCastProvider extends StateNotifier<List<Cast>?> {
  MovieCastProvider(this._service) : super(null);

  final MovieService _service;

  Future<List<Cast>?> getMovieCastsById(int? movieId) async {
    state = await _service.getMovieCastsById(movieId);
    return state;
  }
}
