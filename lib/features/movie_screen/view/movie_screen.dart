import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/assets.dart';
import 'package:uni_society_app/core/constants/api_const.dart';
import 'package:uni_society_app/core/constants/app_constants.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/theme/custom_colors.dart';
import 'package:uni_society_app/core/utils/attributes/attributes.dart';
import 'package:uni_society_app/products/providers/now_playing_prvovider.dart';

import '../../../core/widgets/custom_space.dart';
import '../../../products/models/now_playing_model.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Assets.images.b3PNG,
          fit: BoxFit.contain,
          height: 120,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: Attributes().appBarElevation,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Attributes().scaffoldPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(nowPlaying),
              CustomSpace(
                height: 20,
              ),
              NowPlayingSlider(),
              CustomSpace(
                height: 20,
              ),
              Text(popular),
              PopularList(),
              CustomSpace(
                height: 20,
              ),
              Text(trendMovie),
              PopularList(),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularList extends StatelessWidget {
  const PopularList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: context.width * .35,
              margin: EdgeInsets.all(Attributes().cardPadding),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius:
                    BorderRadius.circular(Attributes().cardBorderRadius),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NowPlayingSlider extends ConsumerWidget {
  const NowPlayingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<NowPlays>?>(
        future: ref.read(nowPlayingProvider.notifier).getNowPlaysMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NowPlays>? nowPlays = snapshot.data;
            return CarouselSlider.builder(
              itemCount: nowPlays?.length,
              itemBuilder: (context, index, realIndex) {
                NowPlays? nowPlay = nowPlays?[index];
                return GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: '$apiImagePath${nowPlay?.posterPath}',
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.broken_image),
                            height: 212,
                            width: 180,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              nowPlay?.title ?? '',
                              style: context.textTheme.bodySmall,
                              maxLines: 2,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_outlined,
                                  size: 20,
                                  color: CustomColorsDark.ratingIconColor,
                                ),
                                Text(
                                  '${nowPlay?.voteAverage?.toStringAsFixed(1)}/10 IMDb',
                                  style: context.textTheme.titleSmall,
                                ),
                              ],
                            ),
                          )
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
