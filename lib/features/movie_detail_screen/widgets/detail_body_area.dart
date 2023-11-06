import 'package:flutter/material.dart';
import 'package:uni_society_app/core/constants/app_constants.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../core/widgets/rating_star_line.dart';
import '../../../products/models/movie_detail_model/movie_detail_model.dart';
import 'cast_list.dart';
import 'similar_list.dart';

class DetailBodyArea extends StatelessWidget {
  const DetailBodyArea({
    super.key,
    required this.movieDetail,
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
                )),
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
            SizedBox(
              height: context.height * 0.1,
              child: ListView.separated(
                  itemCount: movieDetail!.genres!.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const CustomSpace(
                        width: 5,
                      ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: Attributes().genderCardPadding),
                      child: Chip(
                        backgroundColor: CustomColorsDark.chipColorDark,
                        label: Text(
                          movieDetail?.genres?[index].name ?? '',
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                    );
                  }),
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
                    Text(
                        movieDetail?.runtime
                                .toString()
                                .toHour(movieDetail?.runtime) ??
                            '',
                        style: context.textTheme.titleSmall),
                  ],
                ),
                Column(
                  children: [
                    Text(language, style: context.textTheme.titleMedium),
                    const CustomSpace(
                      height: 3,
                    ),
                    Text(movieDetail?.spokenLanguages?.first.name ?? '',
                        style: context.textTheme.titleSmall),
                  ],
                ),
                Column(
                  children: [
                    Text(revenue, style: context.textTheme.titleMedium),
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
            const Text(description),
            const CustomSpace(
              height: 10,
            ),
            Text(
              movieDetail?.overview ?? '',
              style: context.textTheme.bodySmall,
            ),
            const CustomSpace(
              height: 10,
            ),
            const Text(casts),
            const CustomSpace(
              height: 10,
            ),
            SizedBox(
              height: context.height * 0.2,
              child: CastList(id: movieDetail?.id),
            ),
            const CustomSpace(
              height: 10,
            ),
            const Text(similar),
            const CustomSpace(
              height: 10,
            ),
            SizedBox(
              height: context.height * 0.25,
              child: SimilarList(id: movieDetail?.id),
            ),
          ],
        ),
      ),
    );
  }
}
