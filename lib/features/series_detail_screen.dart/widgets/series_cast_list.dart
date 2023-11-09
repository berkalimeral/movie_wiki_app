import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/cast_detail_sheet.dart';
import '../../../products/models/series_detail_model/series_cast_model.dart';
import '../../../products/providers/series_detail_service_provider/series_casts_provider.dart';

class SeriesCastList extends ConsumerWidget {
  const SeriesCastList({super.key, required this.id});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<SeriesCast>?>(
      future: ref.read(seriesCastProvider.notifier).getSeriesCastsById(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SeriesCast>? casts = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: casts?.length,
            itemBuilder: (context, index) {
              SeriesCast? cast = casts?[index];
              return GestureDetector(
                onTap: () {
                  CastDetailSheet.castDetailSeriesBottomSheet(
                      context, cast?.id);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              Attributes().cardBorderRadius),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ApiConstants.apiImagePath}${cast?.profilePath}',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.broken_image),
                            height: 90,
                            width: 70,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: context.width * 0.2,
                            maxHeight: context.height * 0.2,
                          ),
                          child: Text(
                            cast?.originalName ?? '',
                            style: context.textTheme.titleSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: context.width * 0.2,
                            maxHeight: context.height * 0.2,
                          ),
                          child: Text(
                            '(${cast?.character})',
                            style: context.textTheme.titleSmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
      },
    );
  }
}
