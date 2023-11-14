import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/products/providers/movie_service_provider/genres_provider.dart';

import '../../../core/widgets/trend_popular_card.dart';
import '../../../products/models/movie_models/movie_genres_model.dart';
import '../../../products/models/movie_models/popular_movie_model.dart';
import '../../../products/models/movie_models/trend_movie_model.dart';
import '../../../products/models/series_models/popular_series_model.dart';
import '../../../products/models/series_models/trends_series_model.dart';
import '../../../products/providers/series_service_provider/series_genres_provider.dart';
import '../../features/movie_detail_screen/view/movie_detail_screen.dart';
import '../../features/series_detail_screen.dart/view/series_detail_screen.dart';

class BuildTrendPopularCard extends ConsumerStatefulWidget {
  const BuildTrendPopularCard(
      {super.key, required this.future, this.isMovie = false});

  final Future<Object?>? future;
  final bool isMovie;

  @override
  ConsumerState<BuildTrendPopularCard> createState() =>
      _BuildTrendPopularCardState();
}

class _BuildTrendPopularCardState extends ConsumerState<BuildTrendPopularCard> {
  List<Genres>? genres = [];

  @override
  void initState() {
    super.initState();
    widget.isMovie
        ? ref
            .read(genresProvider.notifier)
            .getGenresMovie()
            .then((genreList) => genres = genreList)
        : ref
            .read(genresSeriesProvider.notifier)
            .getSeriesGenres()
            .then((genreList) => genres = genreList);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data is List<TrendsSeries>?) {
              List<TrendsSeries>? trendsSeries =
                  snapshot.data as List<TrendsSeries>?;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendsSeries?.length,
                itemBuilder: (context, index) {
                  TrendsSeries? trend = trendsSeries?[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SeriesDetailScreen(seriesId: trend?.id),
                      ));
                    },
                    child: TrendPopularCard(
                      genres: genres,
                      genreIds: trend?.genreIds,
                      posterPath: trend?.posterPath,
                      title: trend?.name,
                      voteAverage: trend?.voteAverage,
                    ),
                  );
                },
              );
            } else if (snapshot.data is List<PopularSeries>?) {
              List<PopularSeries>? popularSeries =
                  snapshot.data as List<PopularSeries>?;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularSeries?.length,
                itemBuilder: (context, index) {
                  PopularSeries? popular = popularSeries?[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SeriesDetailScreen(seriesId: popular?.id),
                      ));
                    },
                    child: TrendPopularCard(
                      genres: genres,
                      genreIds: popular?.genreIds,
                      posterPath: popular?.posterPath,
                      title: popular?.title,
                      voteAverage: popular?.voteAverage,
                    ),
                  );
                },
              );
            } else if (snapshot.data is List<Populars>?) {
              List<Populars>? popularMovies = snapshot.data as List<Populars>?;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMovies?.length,
                itemBuilder: (context, index) {
                  Populars? popular = popularMovies?[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailScreen(movieId: popular?.id),
                      ));
                    },
                    child: TrendPopularCard(
                      genres: genres,
                      genreIds: popular?.genreIds,
                      posterPath: popular?.posterPath,
                      title: popular?.title,
                      voteAverage: popular?.voteAverage,
                    ),
                  );
                },
              );
            } else {
              List<Trends>? trendsMovie = snapshot.data as List<Trends>?;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendsMovie?.length,
                itemBuilder: (context, index) {
                  Trends? trend = trendsMovie?[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailScreen(movieId: trend?.id),
                      ));
                    },
                    child: TrendPopularCard(
                      genres: genres,
                      genreIds: trend?.genreIds,
                      posterPath: trend?.posterPath,
                      title: trend?.title,
                      voteAverage: trend?.voteAverage,
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
