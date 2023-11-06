import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/series_detail_model/series_cast_model.dart';
import '../../service/series_service.dart';

final seriesCastProvider =
    StateNotifierProvider<SeriesCastProvider, List<SeriesCast>?>(
        (ref) => SeriesCastProvider(SeriesService()));

class SeriesCastProvider extends StateNotifier<List<SeriesCast>?> {
  SeriesCastProvider(this._service) : super(null);

  final SeriesService _service;

  Future<List<SeriesCast>?> getSeriesCastsById(int? seriesId) async {
    state = await _service.getSeriesCastsById(seriesId);
    return state;
  }
}
