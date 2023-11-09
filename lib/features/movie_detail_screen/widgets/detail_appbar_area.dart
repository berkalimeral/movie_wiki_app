import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../products/models/movie_detail_model/movie_detail_model.dart';
import '../../../products/models/series_detail_model/series_detail_model.dart';

class DetailAppBarArea extends StatelessWidget {
  const DetailAppBarArea({super.key, this.movieDetail, this.seriesDetail});

  final MovieDetailModel? movieDetail;
  final SeriesDetailModel? seriesDetail;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      leading: Container(
        margin: EdgeInsets.only(
            top: Attributes().cardPadding, left: Attributes().cardPadding),
        decoration: BoxDecoration(
          color: CustomColorsDark.cardColor,
          borderRadius: BorderRadius.circular(Attributes().cardBorderRadius),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: CustomColorsDark.onBackground,
          ),
        ),
      ),
      backgroundColor: CustomColorsDark.detailBgColor,
      expandedHeight: context.height * 0.4,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Attributes().detailBorderRadius),
            bottomRight: Radius.circular(Attributes().detailBorderRadius),
          ),
          child: seriesDetail == null
              ? CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.apiImagePath}${movieDetail?.posterPath}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                )
              : CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.apiImagePath}${seriesDetail?.posterPath}',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
        ),
      ),
    );
  }
}
