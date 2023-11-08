import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/utils/attributes/attributes.dart';
import 'package:uni_society_app/core/widgets/rating_star_line.dart';
import 'package:uni_society_app/features/movie_detail_screen/widgets/gender_area.dart';
import 'package:uni_society_app/features/series_detail_screen.dart/widgets/series_similar_list.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/custom_colors.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../products/models/series_detail_model/series_detail_model.dart';
import 'series_cast_list.dart';
import 'series_season_list.dart';

class SeriesDetailBodyArea extends StatelessWidget {
  const SeriesDetailBodyArea({super.key, required this.seriesDetail});

  final SeriesDetailModel? seriesDetail;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Attributes().detailPaddingHorizontal,
          vertical: Attributes().scaffoldPaddingVertical,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    constraints: BoxConstraints(
                        maxHeight: context.width * 0.5,
                        maxWidth: context.width * 0.6),
                    child: Text(seriesDetail?.originalName ?? '')),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 35,
                    color: CustomColorsDark.error,
                  ),
                ),
              ],
            ),
            RatingStarLine(rating: seriesDetail?.voteAverage),
            BuildGenderArea(
              seriesDetail: seriesDetail,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(length, style: context.textTheme.titleMedium),
                    const CustomSpace(
                      height: 3,
                    ),
                    seriesDetail!.episodeRunTime!.isNotEmpty
                        ? Text(
                            seriesDetail?.episodeRunTime?.first
                                    .toString()
                                    .toHour(
                                        seriesDetail?.episodeRunTime?.first) ??
                                '',
                            style: context.textTheme.titleSmall)
                        : Text('No Info', style: context.textTheme.titleSmall),
                  ],
                ),
                Column(
                  children: [
                    Text(language, style: context.textTheme.titleMedium),
                    const CustomSpace(
                      height: 3,
                    ),
                    Text(seriesDetail?.spokenLanguages?.first.englishName ?? '',
                        style: context.textTheme.titleSmall),
                  ],
                ),
                Column(
                  children: [
                    Text(season, style: context.textTheme.titleMedium),
                    const CustomSpace(
                      height: 3,
                    ),
                    Text(seriesDetail?.numberOfSeasons.toString() ?? '',
                        style: context.textTheme.titleSmall),
                  ],
                ),
              ],
            ),
            const Divider(),
            const Text(description),
            const CustomSpace(
              height: 5,
            ),
            Text(
              seriesDetail?.overview ?? '',
              style: context.textTheme.bodySmall,
            ),
            const CustomSpace(
              height: 5,
            ),
            const Text(season),
            SizedBox(
              height: context.height * 0.26,
              child: SeasonList(seriesSeason: seriesDetail?.seasons),
            ),
            const CustomSpace(
              height: 5,
            ),
            const Text(casts),
            const CustomSpace(
              height: 5,
            ),
            SizedBox(
              height: context.height * 0.23,
              child: SeriesCastList(id: seriesDetail?.id),
            ),
            const CustomSpace(
              height: 5,
            ),
            const Text(similar),
            const CustomSpace(
              height: 5,
            ),
            SizedBox(
              height: context.height * 0.21,
              child: SeriesSimilarList(id: seriesDetail?.id),
            ),
          ],
        ),
      ),
    );
  }
}
