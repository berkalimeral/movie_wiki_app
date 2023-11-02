import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/popular_movie_model.dart';
import '../service/movie_service.dart';

final popularProvider = StateNotifierProvider<PopularProvider, List<Populars>?>(
    (ref) => PopularProvider(MovieService()));

class PopularProvider extends StateNotifier<List<Populars>?> {
  PopularProvider(
    this._service,
  ) : super([]);

  final MovieService _service;

  Future<List<Populars>?> getNowPlaysMovie() async {
    state = await _service.getPopularMovies();
    return state;
  }
}
