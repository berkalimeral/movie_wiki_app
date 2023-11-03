import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/products/service/movie_service.dart';

import '../../models/movie_models/movie_genres_model.dart';

final genresProvider =
    StateNotifierProvider<GenresProvider, List<MovieGenres>?>(
        (ref) => GenresProvider(MovieService()));

class GenresProvider extends StateNotifier<List<MovieGenres>?> {
  GenresProvider(
    this._service,
  ) : super([]);

  final MovieService _service;

  Future<List<MovieGenres>?> getGenresMovie() async {
    state = await _service.getMovieGenres();
    return state;
  }
}
