import 'package:get_it/get_it.dart';

import 'products/service/movie_series_service.dart';
import 'products/service/movie_service.dart';
import 'products/service/series_service.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<MovieService>(
    () => MovieService(),
  );
  locator.registerLazySingleton<SeriesService>(
    () => SeriesService(),
  );
  locator.registerLazySingleton<MovieSeriesService>(
    () => MovieSeriesService(),
  );
}
