import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/theme/custom_colors.dart';
import 'package:uni_society_app/core/widgets/custom_space.dart';
import 'package:uni_society_app/core/widgets/rating_star_line.dart';
import 'package:uni_society_app/products/providers/movie_service_provider/trending_provider.dart';
import 'package:collection/collection.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../products/models/movie_models/movie_genres_model.dart';
import '../../../products/models/movie_models/trend_movie_model.dart';
import '../../../products/providers/movie_service_provider/genres_provider.dart';
import '../../movie_detail_screen/view/movie_detail_screen.dart';

class TrendList extends ConsumerStatefulWidget {
  const TrendList({
    super.key,
  });

  @override
  ConsumerState<TrendList> createState() => _TrendListState();
}

class _TrendListState extends ConsumerState<TrendList> {
  List<MovieGenres>? genres = [];

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
    return SizedBox(
      height: context.height * .25,
      child: FutureBuilder<List<Trends>?>(
          future: ref.read(trendsProvider.notifier).getTrendingMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Trends>? trends = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: trends?.length,
                itemBuilder: (context, index) {
                  Trends? trend = trends?[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                          movieId: trend.id,
                        ),
                      ));
                    },
                    child: Container(
                      width: context.width * .7,
                      margin: EdgeInsets.all(Attributes().cardPadding),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: CustomColorsDark.cardColor, //New
                              blurRadius: 1.0,
                              offset: const Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.circular(
                            Attributes().cardBorderRadius),
                      ),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: '$apiImagePath${trend?.posterPath}',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.broken_image),
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                          const CustomSpace(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: context.width * 0.4,
                                    maxHeight: context.width * 0.2,
                                  ),
                                  child: Text(
                                    trend?.title ?? '',
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                                RatingStarLine(rating: trend?.voteAverage),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: trend!.genreIds!.map((genreId) {
                                      final genre = genres?.firstWhereOrNull(
                                          (genre) => genre.id == genreId);
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                                Attributes().genderCardPadding),
                                        child: Chip(
                                          backgroundColor:
                                              CustomColorsDark.chipColorDark,
                                          label: Text(
                                            genre?.name ?? '',
                                            style: context.textTheme.titleSmall,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
