import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/products/models/series_models/series_gender_model.dart';
import 'package:uni_society_app/products/providers/series_service_provider/popular_series_provider.dart';
import 'package:uni_society_app/products/providers/series_service_provider/series_genres_provider.dart';
import 'package:collection/collection.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../products/models/series_models/popular_series_model.dart';
import '../../../core/widgets/rating_star_line.dart';

class PopularSeriesCard extends ConsumerStatefulWidget {
  const PopularSeriesCard({
    super.key,
  });

  @override
  ConsumerState<PopularSeriesCard> createState() => _PopularSeriesCardState();
}

class _PopularSeriesCardState extends ConsumerState<PopularSeriesCard> {
  List<SeriesGenres>? genres = [];

  @override
  void initState() {
    super.initState();
    ref
        .read(genresSeriesProvider.notifier)
        .getSeriesGenres()
        .then((genreList) => genres = genreList);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.25,
      child: FutureBuilder<List<PopularSeries>?>(
        future: ref.read(popularSeriesProvider.notifier).getPopularSeries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PopularSeries>? populars = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: populars?.length,
              itemBuilder: (context, index) {
                PopularSeries? popular = populars?[index];
                return GestureDetector(
                  onTap: () {},
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
                          imageUrl: '$apiImagePath${popular?.posterPath}',
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
                                  popular?.name ?? '',
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
        },
      ),
    );
  }
}
