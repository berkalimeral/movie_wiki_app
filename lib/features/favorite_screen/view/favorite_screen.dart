import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';

import '../../../core/constants/api_const.dart';
import '../../../core/theme/custom_colors.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../products/local_db/db_service/model/movie_table.dart';
import '../../../products/local_db/db_service/provider/db_get_movie_provider.dart';
import '../../../products/local_db/db_service/provider/db_save_and_delete_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.your_favorite),
        backgroundColor: CustomColorsDark.cardColor,
      ),
      body: FutureBuilder<List<MovieTable>?>(
        future: ref.read(getMovieProvider.notifier).getMovie(),
        builder: (context, snapshot) {
          List<MovieTable>? favMovies = ref.watch(getMovieProvider);
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return GridView.builder(
                padding: EdgeInsets.all(Attributes().scaffoldPaddingHorizontal),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount: favMovies?.length,
                itemBuilder: (context, index) {
                  MovieTable? favMovie = favMovies?[index];
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            Attributes().cardBorderRadius),
                        child: CachedNetworkImage(
                          imageUrl:
                              '${ApiConstants.apiImagePath}${favMovie?.posterPath}',
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.broken_image),
                          width: 175,
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              ref
                                  .read(saveAndDeleteProvider)
                                  .deleteMovie(favMovie?.id);
                            },
                            icon: const Icon(Icons.delete_outline)),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.empty_favorite,
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: CustomColorsDark.surface),
                ),
              );
            }
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
