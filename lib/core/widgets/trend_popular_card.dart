import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:collection/collection.dart';

import '../../products/models/movie_models/movie_genres_model.dart';
import '../constants/api_const.dart';
import '../theme/custom_colors.dart';
import '../utils/attributes/attributes.dart';
import 'custom_space.dart';
import 'rating_star_line.dart';

class TrendPopularCard extends StatelessWidget {
  const TrendPopularCard({
    super.key,
    this.posterPath,
    this.title,
    this.voteAverage,
    this.genreIds,
    required this.genres,
    this.isSearchData = false,
  });

  final String? posterPath;
  final String? title;
  final double? voteAverage;
  final List<int>? genreIds;
  final List<Genres>? genres;
  final bool isSearchData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSearchData ? double.infinity : context.width * .7,
      height: isSearchData ? context.height * 0.22 : null,
      margin: EdgeInsets.all(Attributes().cardPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: CustomColorsDark.cardColor, //New
              blurRadius: 1.0,
              offset: const Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(Attributes().cardBorderRadius),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: '${ApiConstants.apiImagePath}$posterPath',
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
                    title ?? '',
                    style: context.textTheme.titleMedium,
                  ),
                ),
                RatingStarLine(rating: voteAverage),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: genreIds!.map((genderId) {
                      final genre = genres
                          ?.firstWhereOrNull((genre) => genre.id == genderId);
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
    );
  }
}
