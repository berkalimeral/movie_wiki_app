import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/products/service/movie_service.dart';

import '../models/movie_genres_model.dart';

final genresProvider = StateNotifierProvider<GenresProvider, List<Genres>?>(
    (ref) => GenresProvider(MovieService()));

class GenresProvider extends StateNotifier<List<Genres>?> {
  GenresProvider(
    this._service,
  ) : super([]);

  final MovieService _service;

  Future<List<Genres>?> getGenresMovie() async {
    state = await _service.getMovieGenres();
    return state;
  }
}
