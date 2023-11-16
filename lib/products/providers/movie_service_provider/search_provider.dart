import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie_models/popular_movie_model.dart';
import '../../service/movie_service.dart';

final searchProvider = StateNotifierProvider<SearchProvider, List<Populars>?>(
    (ref) => SearchProvider(MovieService()));

class SearchProvider extends StateNotifier<List<Populars>?> {
  SearchProvider(
    this._service,
  ) : super([]);

  final MovieService _service;

  Future<List<Populars>?> getMovieWithParam(String param) async {
    state = await _service.getMovieWithParam(param);
    return state;
  }
}
