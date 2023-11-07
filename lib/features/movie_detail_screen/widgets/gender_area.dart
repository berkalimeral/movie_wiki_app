import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../products/models/movie_detail_model/movie_detail_model.dart';
import '../../../products/models/series_detail_model/series_detail_model.dart';

class BuildGenderArea extends StatelessWidget {
  const BuildGenderArea({super.key, this.movieDetail, this.seriesDetail});

  final MovieDetailModel? movieDetail;
  final SeriesDetailModel? seriesDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.1,
      child: ListView.separated(
          itemCount: seriesDetail == null
              ? movieDetail!.genres!.length
              : seriesDetail!.genres!.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const CustomSpace(
                width: 5,
              ),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: Attributes().genderCardPadding),
              child: Chip(
                backgroundColor: CustomColorsDark.chipColorDark,
                label: seriesDetail == null
                    ? Text(
                        movieDetail?.genres?[index].name ?? '',
                        style: context.textTheme.titleSmall,
                      )
                    : Text(
                        seriesDetail?.genres?[index].name ?? '',
                        style: context.textTheme.titleSmall,
                      ),
              ),
            );
          }),
    );
  }
}
