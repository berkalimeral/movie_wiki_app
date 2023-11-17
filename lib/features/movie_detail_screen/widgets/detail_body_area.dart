import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../core/widgets/rating_star_line.dart';
import '../../../products/local_db/db_service/provider/db_save_and_delete_provider.dart';
import '../../../products/models/movie_detail_model/movie_detail_model.dart';
import 'cast_list.dart';
import 'gender_area.dart';
import 'similar_list.dart';

class DetailBodyArea extends ConsumerWidget {
  const DetailBodyArea({
    super.key,
    this.movieDetail,
  });

  final MovieDetailModel? movieDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Attributes().detailPaddingHorizontal,
            vertical: Attributes().scaffoldPaddingVertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    movieDetail?.originalTitle ?? '',
                    maxLines: 2,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(saveAndDeleteProvider)
                        .saveMovie(movieDetail!.toMovieDetail(movieDetail));
                  },
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 35,
                    color: CustomColorsDark.error,
                  ),
                ),
              ],
            ),
            RatingStarLine(rating: movieDetail?.voteAverage),
            BuildGenderArea(movieDetail: movieDetail),
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
                    Text(
                        movieDetail?.runtime
                                .toString()
                                .toHour(movieDetail?.runtime) ??
                            '',
                        style: context.textTheme.titleSmall)
                  ],
                ),
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.language,
                        style: context.textTheme.titleMedium),
                    const CustomSpace(
                      height: 3,
                    ),
                    Text(movieDetail?.spokenLanguages?.first.name ?? '',
                        style: context.textTheme.titleSmall),
                  ],
                ),
                Column(
                  children: [
                    Text(AppLocalizations.of(context)!.revenue,
                        style: context.textTheme.titleMedium),
                    const CustomSpace(
                      height: 3,
                    ),
                    Text('${movieDetail?.revenue.toString()}\$',
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
              movieDetail?.overview ?? '',
              style: context.textTheme.bodySmall,
            ),
            const CustomSpace(
              height: 5,
            ),
            Text(AppLocalizations.of(context)!.casts),
            const CustomSpace(
              height: 5,
            ),
            SizedBox(
              height: context.height * 0.18,
              child: CastList(id: movieDetail?.id),
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
              child: SimilarList(id: movieDetail?.id),
            ),
          ],
        ),
      ),
    );
  }
}
