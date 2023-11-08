import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/utils/attributes/attributes.dart';
import 'package:uni_society_app/core/widgets/cast_detail_sheet.dart';
import 'package:uni_society_app/products/providers/movie_detail_service_provider/movie_casts_provider.dart';

import '../../../core/constants/api_const.dart';
import '../../../products/models/movie_detail_model/movie_casts_model.dart';

class CastList extends ConsumerWidget {
  const CastList({super.key, required this.id});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Cast>?>(
      future: ref.read(movieCastProvider.notifier).getMovieCastsById(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Cast>? casts = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: casts?.length,
            itemBuilder: (context, index) {
              Cast? cast = casts?[index];
              return GestureDetector(
                onTap: () {
                  CastDetailSheet.castDetailBottomSheet(context, cast?.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            Attributes().cardBorderRadius),
                        child: CachedNetworkImage(
                          imageUrl: '$apiImagePath${cast?.profilePath}',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
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
                    ],
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
