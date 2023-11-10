import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../widgets/popular_series_card.dart';
import '../widgets/top_rated_card.dart';
import '../widgets/trending_series_card.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const PopularSeriesCard(),
              const CustomSpace(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.trendSeries),
              const TrendSeriesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
