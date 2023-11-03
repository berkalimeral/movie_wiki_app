import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';
import '../../../products/models/series_models/popular_series_model.dart';
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
            children: const [
              Text(topRated),
              CustomSpace(
                height: 20,
              ),
              TopRatedCard(),
              CustomSpace(
                height: 20,
              ),
              Text(popularSeries),
              CustomSpace(
                height: 20,
              ),
              PopularSeriesCard(),
              CustomSpace(
                height: 20,
              ),
              Text(trendSeries),
              TrendSeriesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
