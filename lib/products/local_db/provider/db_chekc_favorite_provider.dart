import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_service/db_service.dart';

final checkFavoriteProvider =
    StateNotifierProvider<CheckFavoriteProvider, bool>(
        (ref) => CheckFavoriteProvider(DBService()));

class CheckFavoriteProvider extends StateNotifier<bool> {
  CheckFavoriteProvider(
    this._dbService,
  ) : super(false);

  final DBService _dbService;

  Future<bool> isFavorite(int movieId) async {
    state = await _dbService.isFavorite(movieId);
    return state;
  }
}
