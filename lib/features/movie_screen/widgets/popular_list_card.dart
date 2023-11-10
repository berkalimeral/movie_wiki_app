import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:collection/collection.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../core/widgets/rating_star_line.dart';
import '../../../products/models/movie_models/movie_genres_model.dart';
import '../../../products/models/movie_models/popular_movie_model.dart';
import '../../../products/providers/movie_service_provider/genres_provider.dart';
import '../../../products/providers/movie_service_provider/popular_provider.dart';
import '../../movie_detail_screen/view/movie_detail_screen.dart';

class PopularList extends ConsumerStatefulWidget {
  const PopularList({
    super.key,
  });

  @override
  ConsumerState<PopularList> createState() => _PopularListState();
}

class _PopularListState extends ConsumerState<PopularList> {
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
      child: FutureBuilder<List<Populars>?>(
          future: ref.read(popularProvider.notifier).getNowPlaysMovie(),
          builder: (context, snapshot) {
            List<Populars>? populars = snapshot.data;
            if (snapshot.hasData) {
              return PopularMovieCard(populars: populars, genres: genres);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class PopularCardShimmer extends StatelessWidget {
  const PopularCardShimmer({
    super.key,
    required this.populars,
  });

  final List<Populars>? populars;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: populars?.length ?? 10,
        itemBuilder: (context, index) {
          return Container(
            width: context.width * .7,
            margin: EdgeInsets.all(Attributes().cardPadding),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: CustomColorsDark.cardColor, //New
                    blurRadius: 1.0,
                    offset: const Offset(0, 0))
              ],
              borderRadius:
                  BorderRadius.circular(Attributes().cardBorderRadius),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 18,
                    color: Colors.amber.shade500,
                  ),
                ),
                const CustomSpace(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: context.width * 0.4,
                            maxHeight: context.width * 0.2,
                          ),
                          width: double.infinity,
                          color: Colors.amber.shade500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Flexible(
                          child: Container(
                            width: double.infinity,
                            color: Colors.amber.shade500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Flexible(
                          child: Container(
                            width: double.infinity,
                            color: Colors.amber.shade500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PopularMovieCard extends StatelessWidget {
  const PopularMovieCard({
    super.key,
    required this.populars,
    required this.genres,
  });

  final List<Populars>? populars;
  final List<MovieGenres>? genres;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: populars?.length,
      itemBuilder: (context, index) {
        Populars? popular = populars?[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieId: popular.id,
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
              borderRadius:
                  BorderRadius.circular(Attributes().cardBorderRadius),
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.apiImagePath}${popular?.posterPath}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
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
                          popular?.title ?? '',
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      RatingStarLine(rating: popular?.voteAverage),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: popular!.genreIds!.map((genderId) {
                            final genre = genres?.firstWhereOrNull(
                                (genre) => genre.id == genderId);
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: Attributes().genderCardPadding),
                              child: Chip(
                                backgroundColor: CustomColorsDark.chipColorDark,
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
  }
}
