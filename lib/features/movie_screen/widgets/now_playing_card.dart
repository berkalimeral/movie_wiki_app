import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/features/movie_detail_screen/view/movie_detail_screen.dart';

import '../../../core/constants/api_const.dart';
import '../../../products/models/movie_models/now_playing_model.dart';
import '../../../products/providers/movie_service_provider/now_playing_prvovider.dart';
import '../../../core/widgets/rating_star_line.dart';

class NowPlayingSlider extends ConsumerWidget {
  const NowPlayingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<NowPlays>?>(
        future: ref.read(nowPlayingProvider.notifier).getNowPlaysMovie(),
        builder: (context, snapshot) {
          List<NowPlays>? nowPlays = snapshot.data;
          if (snapshot.hasData) {
            return NowPlayingCard(nowPlays: nowPlays);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return NowPlayingShimmer(nowPlays: nowPlays);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class NowPlayingCard extends StatelessWidget {
  const NowPlayingCard({
    super.key,
    required this.nowPlays,
  });

  final List<NowPlays>? nowPlays;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: nowPlays?.length,
      itemBuilder: (context, index, realIndex) {
        NowPlays? nowPlay = nowPlays?[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetailScreen(
                movieId: nowPlay?.id,
              ),
            ));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.apiImagePath}${nowPlay?.posterPath}',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                    height: 212,
                    width: 180,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      nowPlay?.title ?? '',
                      style: context.textTheme.bodySmall,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RatingStarLine(rating: nowPlay?.voteAverage),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 310,
        autoPlay: true,
        viewportFraction: .5,
        enlargeCenterPage: true,
        pageSnapping: true,
        disableCenter: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}

class NowPlayingShimmer extends StatelessWidget {
  const NowPlayingShimmer({
    super.key,
    required this.nowPlays,
  });

  final List<NowPlays>? nowPlays;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: CarouselSlider.builder(
        itemCount: nowPlays?.length ?? 10,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 212,
                    width: 180,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 18,
                      color: Colors.amber.shade500,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: double.infinity,
                        height: 18,
                        color: Colors.amber.shade300,
                      )),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 310,
          autoPlay: true,
          viewportFraction: .5,
          enlargeCenterPage: true,
          pageSnapping: true,
          disableCenter: true,
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}
