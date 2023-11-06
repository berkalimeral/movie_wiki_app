import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/utils/attributes/attributes.dart';
import 'package:uni_society_app/core/widgets/custom_space.dart';
import 'package:uni_society_app/products/providers/movie_detail_service_provider/movie_similar_provider.dart';

import '../../../core/constants/api_const.dart';
import '../../../products/models/movie_detail_model/movie_similar_model.dart';
import '../view/movie_detail_screen.dart';

class SimilarList extends ConsumerWidget {
  const SimilarList({super.key, required this.id});

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<SimilarMovie>?>(
      future: ref
          .read(movieRecommendationProvider.notifier)
          .getMovieSimilarById(id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<SimilarMovie>? similars = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: similars?.length,
            itemBuilder: (context, index) {
              SimilarMovie? similar = similars?[index];
              if (similars != null) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(
                              movieId: similar?.id,
                            ),
                          ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              Attributes().cardBorderRadius),
                          child: CachedNetworkImage(
                            imageUrl:
                                '$apiImagePath${similar?.backdropPath ?? '/5pGWjnM62Zs0S1xRf3TDL1Xizr.jpg'}',
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
                      ),
                      const CustomSpace(
                        height: 5,
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: context.width * 0.2,
                          maxHeight: context.height * 0.2,
                        ),
                        child: Text(
                          similar?.originalTitle ?? '',
                          style: context.textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }
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
