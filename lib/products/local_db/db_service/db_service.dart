import 'package:hive/hive.dart';
import 'package:uni_society_app/products/local_db/model/movie_table.dart';

import '../../../core/base/local_data_source.dart';

class DBService extends MovieLocalDataSource {
  @override
  Future<void> deleteMovie(int? movieId) async {
    final box = await Hive.openBox('movieBox');
    box.delete(movieId);
  }

  @override
  Future<List<MovieTable>?> getMovie() async {
    final box = await Hive.openBox('movieBox');
    final movieIds = box.keys;
    List<MovieTable> movieTable = [];
    for (var key in movieIds) {
      movieTable.add(box.get(key));
    }
    return movieTable;
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final box = await Hive.openBox('movieBox');
    return box.containsKey(movieId);
  }

  @override
  Future<void> saveMovie(MovieTable movie) async {
    final box = await Hive.openBox('movieBox');
    await box.put(movie.id, movie);
  }
}
