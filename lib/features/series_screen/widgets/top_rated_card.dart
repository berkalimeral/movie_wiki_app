import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/features/series_detail_screen.dart/view/series_detail_screen.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../products/models/series_models/top_rated_series_model.dart';
import '../../../products/providers/series_service_provider/top_rated_series_providers.dart';
import '../../../core/widgets/rating_star_line.dart';

class TopRatedCard extends ConsumerWidget {
  const TopRatedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<TopRateds>?>(
        future: ref.read(topRatedProvider.notifier).getTopRatedSeries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TopRateds>? topRateds = snapshot.data;
            return CarouselSlider.builder(
              itemCount: topRateds?.length,
              itemBuilder: (context, index, realIndex) {
                TopRateds? topRated = topRateds?[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SeriesDetailScreen(seriesId: topRated?.id),
                    ));
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22),
                    ),
                    child: Card(
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: '$apiImagePath${topRated?.posterPath}',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.broken_image),
                            width: context.width * 0.25,
                            fit: BoxFit.fitWidth,
                            filterQuality: FilterQuality.high,
                          ),
                          const CustomSpace(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topRated?.originalName ?? '',
                                  maxLines: 2,
                                  style: context.textTheme.titleMedium,
                                ),
                                Text(
                                  '(${topRated?.name})',
                                  maxLines: 2,
                                  style: context.textTheme.titleMedium,
                                ),
                                RatingStarLine(rating: topRated?.voteAverage),
                                Text(
                                  'Firs Air Date: ${topRated?.firstAirDate}',
                                  maxLines: 2,
                                  style: context.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                scrollDirection: Axis.vertical,
                height: context.height * 0.4,
                autoPlay: true,
                viewportFraction: .5,
                enlargeCenterPage: true,
                pageSnapping: true,
                disableCenter: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
