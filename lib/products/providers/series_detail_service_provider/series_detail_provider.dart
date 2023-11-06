import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/series_detail_model/series_detail_model.dart';
import '../../service/series_service.dart';

final seriesDetailProvider =
    StateNotifierProvider<SeriesDetailProvider, SeriesDetailModel?>(
        (ref) => SeriesDetailProvider(SeriesService()));

class SeriesDetailProvider extends StateNotifier<SeriesDetailModel?> {
  SeriesDetailProvider(this._service) : super(null);

  final SeriesService _service;

  Future<SeriesDetailModel?> getSeriesDetail(int seriesId) async {
    state = await _service.getSeriesDetailById(seriesId);
    return state;
  }
}
