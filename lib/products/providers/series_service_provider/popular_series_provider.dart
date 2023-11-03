import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/series_models/popular_series_model.dart';
import '../../service/series_service.dart';

final popularSeriesProvider =
    StateNotifierProvider<PopularSeriesProvider, List<PopularSeries>?>(
        (ref) => PopularSeriesProvider(SeriesService()));

class PopularSeriesProvider extends StateNotifier<List<PopularSeries>?> {
  PopularSeriesProvider(
    this._service,
  ) : super([]);

  final SeriesService _service;

  Future<List<PopularSeries>?> getPopularSeries() async {
    state = await _service.getPopularSeries();
    return state;
  }
}
