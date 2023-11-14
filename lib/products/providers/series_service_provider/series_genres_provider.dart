import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/movie_models/movie_genres_model.dart';
import '../../service/series_service.dart';

final genresSeriesProvider =
    StateNotifierProvider<SeriesGenresProvider, List<Genres>?>(
        (ref) => SeriesGenresProvider(SeriesService()));

class SeriesGenresProvider extends StateNotifier<List<Genres>?> {
  SeriesGenresProvider(
    this._service,
  ) : super([]);

  final SeriesService _service;

  Future<List<Genres>?> getSeriesGenres() async {
    state = await _service.getSeriesGenres();
    return state;
  }
}
