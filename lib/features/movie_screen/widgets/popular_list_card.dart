import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/theme/custom_colors.dart';
import 'package:uni_society_app/core/widgets/custom_space.dart';
import 'package:uni_society_app/features/movie_screen/widgets/rating_star_line.dart';
import 'package:uni_society_app/products/models/movie_models/popular_movie_model.dart';
import 'package:uni_society_app/products/providers/movie_service_provider/genres_provider.dart';
import 'package:uni_society_app/products/providers/movie_service_provider/popular_provider.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../products/models/movie_models/movie_genres_model.dart';

class PopularList extends ConsumerStatefulWidget {
  const PopularList({
    super.key,
  });

  @override
  ConsumerState<PopularList> createState() => _PopularListState();
}

class _PopularListState extends ConsumerState<PopularList> {
  List<Genres>? genres = [];

  @override
  void initState() {
    super.initState();
    ref
        .read(genresProvider.notifier)
        .getGenresMovie()
        .then((genreList) => genres = genreList);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .25,
      child: FutureBuilder<List<Populars>?>(
          future: ref.read(popularProvider.notifier).getNowPlaysMovie(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Populars>? populars = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: populars?.length,
                itemBuilder: (context, index) {
                  Populars? popular = populars?[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: context.width * .7,
                      margin: EdgeInsets.all(Attributes().cardPadding),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: CustomColorsDark.cardColor, //New
                              blurRadius: 1.0,
                              offset: const Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.circular(
                            Attributes().cardBorderRadius),
                      ),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: '$apiImagePath${popular?.posterPath}',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.broken_image),
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                          const CustomSpace(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: context.width * 0.4,
                                    maxHeight: context.width * 0.2,
                                  ),
                                  child: Text(
                                    popular?.title ?? '',
                                    style: context.textTheme.titleMedium,
                                  ),
                                ),
                                RatingStarLine(rating: popular?.voteAverage),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children:
                                        popular!.genreIds!.map((genderId) {
                                      final genre = genres?.firstWhere(
                                          (genre) => genre.id == genderId);
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                                Attributes().genderCardPadding),
                                        child: Chip(
                                          backgroundColor:
                                              CustomColorsDark.chipColorDark,
                                          label: Text(
                                            genre?.name ?? '',
                                            style: context.textTheme.titleSmall,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
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
          }),
    );
  }
}
