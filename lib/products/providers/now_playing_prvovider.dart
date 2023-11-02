import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/products/service/movie_service.dart';

import '../models/now_playing_model.dart';

final nowPlayingProvider =
    StateNotifierProvider<NowPlayingProvider, List<NowPlays>?>(
        (ref) => NowPlayingProvider(MovieService()));

class NowPlayingProvider extends StateNotifier<List<NowPlays>?> {
  NowPlayingProvider(
    this._service,
  ) : super([]);

  final MovieService _service;

  Future<List<NowPlays>?> getNowPlaysMovie() async {
    state = await _service.getNowPlayingMovies();
    return state;
  }
}
