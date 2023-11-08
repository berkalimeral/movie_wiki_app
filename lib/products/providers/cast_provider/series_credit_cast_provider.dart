import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/cast_model/series_credit_cast_model.dart';
import '../../service/series_service.dart';

final seriesCreditProvider =
    StateNotifierProvider<SeriesCreditProvider, List<SeriesCreditCast>?>(
        (ref) => SeriesCreditProvider(SeriesService()));

class SeriesCreditProvider extends StateNotifier<List<SeriesCreditCast>?> {
  SeriesCreditProvider(
    this._service,
  ) : super([]);

  final SeriesService _service;

  Future<List<SeriesCreditCast>?> getSeriesCreditCast(int? id) async {
    state = await _service.getSeriesCreditCast(id);
    return state;
  }
}
