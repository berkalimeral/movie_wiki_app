import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_service.dart';
import '../model/movie_table.dart';

final getMovieProvider =
    StateNotifierProvider<GetMovieProvider, List<MovieTable>?>(
        (ref) => GetMovieProvider(DBService()));

class GetMovieProvider extends StateNotifier<List<MovieTable>?> {
  GetMovieProvider(
    this._dbService,
  ) : super([]);

  final DBService _dbService;

  Future<List<MovieTable>?> getMovie() async {
    state = await _dbService.getMovie();
    return state;
  }
}
