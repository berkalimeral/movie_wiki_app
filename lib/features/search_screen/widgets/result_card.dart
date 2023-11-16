import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/trend_popular_card.dart';
import '../../../products/models/movie_models/movie_genres_model.dart';
import '../../../products/models/movie_models/popular_movie_model.dart';
import '../../../products/providers/movie_service_provider/genres_provider.dart';

class ResultsCard extends ConsumerStatefulWidget {
  const ResultsCard({super.key, required this.future});

  final Future<List<Populars>?>? future;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResultsCardState();
}

class _ResultsCardState extends ConsumerState<ResultsCard> {
  List<Genres>? genres = [];

  @override
  void initState() {
    super.initState();
    ref
        .read(genresProvider.notifier)
        .getGenresMovie()
        .then((genreList) => genres = genreList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Populars>?>(
      future: widget.future,
      builder: (context, snapshot) {
        List<Populars>? searchData = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: searchData?.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              Populars? data = searchData?[index];
              return TrendPopularCard(
                genres: genres,
                genreIds: data?.genreIds,
                posterPath: data?.posterPath,
                title: data?.title,
                voteAverage: data?.voteAverage,
                isSearchData: true,
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
