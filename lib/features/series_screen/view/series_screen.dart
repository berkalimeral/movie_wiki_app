import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/products/providers/series_service_provider/popular_series_provider.dart';
import 'package:uni_society_app/products/providers/series_service_provider/trending_series_provider.dart';

import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/build_trend_popular_card.dart';
import '../../../core/widgets/custom_space.dart';
import '../widgets/top_rated_card.dart';

class SeriesScreen extends ConsumerWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(Attributes().scaffoldPaddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.topRated),
              const CustomSpace(
                height: 10,
              ),
              const TopRatedCard(),
              const CustomSpace(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.popularSeries),
              const CustomSpace(
                height: 10,
              ),
              BuildTrendPopularCard(
                future:
                    ref.read(popularSeriesProvider.notifier).getPopularSeries(),
              ),
              const CustomSpace(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.trendSeries),
              BuildTrendPopularCard(
                future:
                    ref.read(trendSeriesProvider.notifier).getTrendingSeries(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
