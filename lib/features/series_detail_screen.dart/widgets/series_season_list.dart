import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../core/widgets/rating_star_line.dart';
import '../../../products/models/series_detail_model/series_detail_model.dart';

class SeasonList extends StatelessWidget {
  const SeasonList({super.key, required this.seriesSeason});

  final List<Seasons>? seriesSeason;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: Attributes().genderCardPadding),
      scrollDirection: Axis.horizontal,
      itemCount: seriesSeason?.length,
      itemBuilder: (context, index) {
        Seasons? season = seriesSeason?[index];
        return Container(
          width: context.width * .8,
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
                imageUrl: season?.posterPath == null
                    ? AppConstants.dummyPath
                    : '${ApiConstants.apiImagePath}${season?.posterPath}',
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
                    Text(
                      season?.name ?? '',
                      style: context.textTheme.titleMedium,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: context.width * 0.6,
                        maxHeight: context.height * 0.11,
                      ),
                      child: Text(
                        season?.overview ?? '',
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                    const CustomSpace(
                      height: 3,
                    ),
                    Text(
                      '${season?.airDate?.split('-').first} | ${season?.episodeCount} Episode',
                      style: context.textTheme.titleMedium,
                    ),
                    RatingStarLine(rating: season?.voteAverage),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
