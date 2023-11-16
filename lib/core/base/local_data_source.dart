import '../../products/local_db/model/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movie);
  Future<List<MovieTable>?> getMovie();
  Future<void> deleteMovie(int movieId);
  Future<bool> isFavorite(int movieId);
}
