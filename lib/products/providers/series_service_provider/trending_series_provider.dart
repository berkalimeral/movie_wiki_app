import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/series_models/trends_series_model.dart';
import '../../service/series_service.dart';

final trendSeriesProvider =
    StateNotifierProvider<TrendSeriesProvider, List<TrendsSeries>?>(
        (ref) => TrendSeriesProvider(SeriesService()));

class TrendSeriesProvider extends StateNotifier<List<TrendsSeries>?> {
  TrendSeriesProvider(
    this._service,
  ) : super([]);

  final SeriesService _service;

  Future<List<TrendsSeries>?> getTopRatedSeries() async {
    state = await _service.getTrendingSeries();
    return state;
  }
}
