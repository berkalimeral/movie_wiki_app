import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../core/widgets/rating_star_line.dart';
import '../../../products/models/series_detail_model/series_detail_model.dart';
import '../../movie_detail_screen/widgets/gender_area.dart';
import 'series_cast_list.dart';
import 'series_season_list.dart';
import 'series_similar_list.dart';

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
                    Text(AppLocalizations.of(context)!.length,
                        style: context.textTheme.titleMedium),
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
                    Text(AppLocalizations.of(context)!.language,
                        style: context.textTheme.titleMedium),
                    const CustomSpace(
                      height: 3,
                    ),
                    Text(seriesDetail?.spokenLanguages?.first.englishName ?? '',
                        style: context.textTheme.titleSmall),
                  ],
                ),
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.season,
                        style: context.textTheme.titleMedium),
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
            Text(AppLocalizations.of(context)!.description),
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
            Text(AppLocalizations.of(context)!.season),
            SizedBox(
              height: context.height * 0.26,
              child: SeasonList(seriesSeason: seriesDetail?.seasons),
            ),
            const CustomSpace(
              height: 5,
            ),
            Text(AppLocalizations.of(context)!.casts),
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
            Text(AppLocalizations.of(context)!.similar),
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
