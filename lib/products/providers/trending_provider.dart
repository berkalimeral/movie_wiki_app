import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/trend_movie_model.dart';
import '../service/movie_service.dart';

final trendsProvider = StateNotifierProvider<TrendsProvider, List<Trends>?>(
    (ref) => TrendsProvider(MovieService()));

class TrendsProvider extends StateNotifier<List<Trends>?> {
  TrendsProvider(
    this._service,
  ) : super([]);

  final MovieService _service;

  Future<List<Trends>?> getTrendingMovies() async {
    state = await _service.getTrendingMovies();
    return state;
  }
}
