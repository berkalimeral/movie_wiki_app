import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_service/db_service.dart';
import '../model/movie_table.dart';

final saveAndDeleteProvider =
    Provider((ref) => SaveAndDeleteProvider(DBService()));

class SaveAndDeleteProvider extends ChangeNotifier {
  SaveAndDeleteProvider(this._dbService);

  final DBService _dbService;

  Future<void> saveMovie(MovieTable movie) async {
    await _dbService.saveMovie(movie);
  }

  Future<void> deleteMovie(int? id) async {
    await _dbService.deleteMovie(id);
  }
}
