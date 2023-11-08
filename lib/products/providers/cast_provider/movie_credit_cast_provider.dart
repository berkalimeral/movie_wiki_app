import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/cast_model/movie_credit_cast_model.dart';
import '../../service/movie_service.dart';

final movieCreditProvider =
    StateNotifierProvider<MovieCreditProvider, List<MovieCreditCast>?>(
        (ref) => MovieCreditProvider(MovieService()));

class MovieCreditProvider extends StateNotifier<List<MovieCreditCast>?> {
  MovieCreditProvider(
    this._service,
  ) : super([]);

  final MovieService _service;

  Future<List<MovieCreditCast>?> getMovieCreditCast(int? id) async {
    state = await _service.getMovieCreditCast(id);
    return state;
  }
}
