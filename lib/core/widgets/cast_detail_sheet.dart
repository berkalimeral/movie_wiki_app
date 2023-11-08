import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../features/movie_detail_screen/view/movie_detail_screen.dart';
import '../../features/series_detail_screen.dart/view/series_detail_screen.dart';
import '../../products/models/cast_model/cast_model.dart';
import '../../products/models/cast_model/movie_credit_cast_model.dart';
import '../../products/models/cast_model/series_credit_cast_model.dart';
import '../../products/providers/cast_provider/cast_provider.dart';
import '../../products/providers/cast_provider/movie_credit_cast_provider.dart';
import '../../products/providers/cast_provider/series_credit_cast_provider.dart';
import '../constants/api_const.dart';
import '../constants/app_constants.dart';
import '../theme/custom_colors.dart';
import '../utils/attributes/attributes.dart';
import 'custom_space.dart';

class CastDetailSheet {
  static Future<dynamic> castDetailBottomSheet(BuildContext context, int? id) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            return Container(
              padding: EdgeInsets.all(Attributes().cardPadding),
              height: context.height * 0.5,
              decoration: BoxDecoration(
                color: CustomColorsDark.detailBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Attributes().cardBorderRadius),
                  topRight: Radius.circular(Attributes().cardBorderRadius),
                ),
              ),
              child: FutureBuilder<CastModel?>(
                future: ref.read(castProvider.notifier).getCastsById(id),
                builder: (context, snapshot) {
                  CastModel? star = snapshot.data;
                  return SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: Attributes().circleAvatarRadius,
                          backgroundImage: star?.profilePath != null
                              ? NetworkImage(
                                  '$apiImagePath${star?.profilePath}',
                                )
                              : const NetworkImage(dummyPath),
                        ),
                        Text(star?.name ?? ''),
                        Text(
                          'Age: ${star?.birthday?.calcAge()}',
                          style: context.textTheme.titleSmall,
                        ),
                        const CustomSpace(
                          height: 3,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: context.width * 0.35,
                            maxWidth: context.width * 0.9,
                          ),
                          child: Text(
                            star?.biography ?? '',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleSmall,
                          ),
                        ),
                        const CustomSpace(
                          height: 3,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Known For')),
                        const CustomSpace(
                          height: 3,
                        ),
                        SizedBox(
                          height: context.height * 0.22,
                          child: FutureBuilder<List<MovieCreditCast>?>(
                              future: ref
                                  .read(movieCreditProvider.notifier)
                                  .getMovieCreditCast(id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<MovieCreditCast>? credits =
                                      snapshot.data;
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: credits?.length,
                                    itemBuilder: (context, index) {
                                      MovieCreditCast? movies = credits?[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailScreen(
                                              movieId: movies?.id,
                                            ),
                                          ));
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .circular(Attributes()
                                                          .cardBorderRadius),
                                                  child: CachedNetworkImage(
                                                    imageUrl: movies
                                                                ?.backdropPath !=
                                                            null
                                                        ? '$apiImagePath${movies?.backdropPath}'
                                                        : dummyPath,
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(
                                                            Icons.broken_image),
                                                    height: 90,
                                                    width: 70,
                                                    fit: BoxFit.cover,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        context.width * 0.3,
                                                    maxHeight:
                                                        context.height * 0.2,
                                                  ),
                                                  child: Text(
                                                    movies?.originalTitle ?? '',
                                                    style: context
                                                        .textTheme.titleSmall,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        context.width * 0.3,
                                                    maxHeight:
                                                        context.height * 0.2,
                                                  ),
                                                  child: Text(
                                                    '(${movies?.character})',
                                                    style: context
                                                        .textTheme.titleSmall,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  static Future<dynamic> castDetailSeriesBottomSheet(
      BuildContext context, int? id) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            return Container(
              padding: EdgeInsets.all(Attributes().cardPadding),
              height: context.height * 0.5,
              decoration: BoxDecoration(
                color: CustomColorsDark.detailBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Attributes().cardBorderRadius),
                  topRight: Radius.circular(Attributes().cardBorderRadius),
                ),
              ),
              child: FutureBuilder<CastModel?>(
                future: ref.read(castProvider.notifier).getCastsById(id),
                builder: (context, snapshot) {
                  CastModel? star = snapshot.data;
                  return SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: Attributes().circleAvatarRadius,
                          backgroundImage: star?.profilePath != null
                              ? NetworkImage(
                                  '$apiImagePath${star?.profilePath}',
                                )
                              : const NetworkImage(dummyPath),
                        ),
                        Text(star?.name ?? ''),
                        Text(
                          'Age: ${star?.birthday?.calcAge()}',
                          style: context.textTheme.titleSmall,
                        ),
                        const CustomSpace(
                          height: 3,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: context.width * 0.35,
                            maxWidth: context.width * 0.9,
                          ),
                          child: Text(
                            star?.biography ?? '',
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleSmall,
                          ),
                        ),
                        const CustomSpace(
                          height: 3,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Known For')),
                        const CustomSpace(
                          height: 3,
                        ),
                        SizedBox(
                          height: context.height * 0.22,
                          child: FutureBuilder<List<SeriesCreditCast>?>(
                              future: ref
                                  .read(seriesCreditProvider.notifier)
                                  .getSeriesCreditCast(id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<SeriesCreditCast>? credits =
                                      snapshot.data;
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: credits?.length,
                                    itemBuilder: (context, index) {
                                      SeriesCreditCast? series =
                                          credits?[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                SeriesDetailScreen(
                                              seriesId: series?.id,
                                            ),
                                          ));
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .circular(Attributes()
                                                          .cardBorderRadius),
                                                  child: CachedNetworkImage(
                                                    imageUrl: series
                                                                ?.backdropPath !=
                                                            null
                                                        ? '$apiImagePath${series?.backdropPath}'
                                                        : dummyPath,
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(
                                                            Icons.broken_image),
                                                    height: 90,
                                                    width: 70,
                                                    fit: BoxFit.cover,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        context.width * 0.3,
                                                    maxHeight:
                                                        context.height * 0.2,
                                                  ),
                                                  child: Text(
                                                    series?.originalName ?? '',
                                                    style: context
                                                        .textTheme.titleSmall,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        context.width * 0.3,
                                                    maxHeight:
                                                        context.height * 0.2,
                                                  ),
                                                  child: Text(
                                                    '(${series?.character})',
                                                    style: context
                                                        .textTheme.titleSmall,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
