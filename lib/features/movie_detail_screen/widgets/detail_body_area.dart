import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uni_society_app/core/constants/app_constants.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../core/widgets/rating_star_line.dart';
import '../../../products/models/movie_detail_model/movie_detail_model.dart';
import 'cast_list.dart';
import 'gender_area.dart';
import 'similar_list.dart';

class DetailBodyArea extends StatelessWidget {
  const DetailBodyArea({
    super.key,
    this.movieDetail,
  });

  final MovieDetailModel? movieDetail;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
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
                    Text(AppConstants.length.tr(),
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
                    Text(AppConstants.language.tr(),
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
                    Text(AppConstants.revenue.tr(),
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
            Text(AppConstants.description.tr()),
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
            Text(AppConstants.casts.tr()),
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
            Text(AppConstants.similar.tr()),
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
