import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/cast_model/cast_model.dart';
import '../../service/movie_series_service.dart';

final castProvider = StateNotifierProvider<CastProvider, CastModel?>(
    (ref) => CastProvider(MovieSeriesService()));

class CastProvider extends StateNotifier<CastModel?> {
  CastProvider(
    this._service,
  ) : super(null);

  final MovieSeriesService _service;

  Future<CastModel?> getCastsById(int? id) async {
    state = await _service.getCastsById(id);
    return state;
  }
}
