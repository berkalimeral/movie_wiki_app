import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/series_detail_model/series_similar_model.dart';
import '../../service/series_service.dart';

final seriesSimilarProvider =
    StateNotifierProvider<SeriesSimilarProvider, List<SimilarSeries>?>(
        (ref) => SeriesSimilarProvider(SeriesService()));

class SeriesSimilarProvider extends StateNotifier<List<SimilarSeries>?> {
  SeriesSimilarProvider(this._service) : super(null);

  final SeriesService _service;

  Future<List<SimilarSeries>?> getSeriesSimilarById(int? seriesId) async {
    state = await _service.getSeriesSimilarById(seriesId);
    return state;
  }
}
