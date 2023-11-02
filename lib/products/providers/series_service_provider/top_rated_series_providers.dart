import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/series_models/top_rated_series_model.dart';
import '../../service/series_service.dart';

final topRatedProvider =
    StateNotifierProvider<TopRatedProvider, List<TopRateds>?>(
        (ref) => TopRatedProvider(SeriesService()));

class TopRatedProvider extends StateNotifier<List<TopRateds>?> {
  TopRatedProvider(
    this._service,
  ) : super([]);

  final SeriesService _service;

  Future<List<TopRateds>?> getTopRatedSeries() async {
    state = await _service.getTopRatedSeries();
    return state;
  }
}
