import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/build_trend_popular_card.dart';
import '../../../core/widgets/custom_space.dart';

import '../../../products/providers/movie_service_provider/popular_provider.dart';
import '../../../products/providers/movie_service_provider/trending_provider.dart';
import '../widgets/now_playing_card.dart';

class MovieScreen extends ConsumerWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Attributes().scaffoldPaddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.nowPlaying),
              const CustomSpace(
                height: 10,
              ),
              const NowPlayingSlider(),
              const CustomSpace(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.popular),
              BuildTrendPopularCard(
                future: ref.read(popularProvider.notifier).getPopularMovie(),
                isMovie: true,
              ),
              const CustomSpace(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.trendMovie),
              BuildTrendPopularCard(
                future: ref.read(trendsProvider.notifier).getTrendingMovies(),
                isMovie: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
