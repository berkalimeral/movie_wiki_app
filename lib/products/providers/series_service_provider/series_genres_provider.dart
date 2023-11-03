import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/series_models/series_gender_model.dart';
import '../../service/series_service.dart';

final genresSeriesProvider =
    StateNotifierProvider<SeriesGenresProvider, List<SeriesGenres>?>(
        (ref) => SeriesGenresProvider(SeriesService()));

class SeriesGenresProvider extends StateNotifier<List<SeriesGenres>?> {
  SeriesGenresProvider(
    this._service,
  ) : super([]);

  final SeriesService _service;

  Future<List<SeriesGenres>?> getSeriesGenres() async {
    state = await _service.getSeriesGenres();
    return state;
  }
}
