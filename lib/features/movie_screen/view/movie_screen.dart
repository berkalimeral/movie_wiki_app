import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:uni_society_app/core/constants/app_constants.dart';
import 'package:uni_society_app/core/utils/attributes/attributes.dart';
import 'package:uni_society_app/features/movie_screen/widgets/trending_list_card.dart';

import '../../../core/widgets/custom_space.dart';

import '../widgets/now_playing_card.dart';
import '../widgets/popular_list_card.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Attributes().scaffoldPaddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppConstants.nowPlaying.tr()),
              const CustomSpace(
                height: 10,
              ),
              const NowPlayingSlider(),
              const CustomSpace(
                height: 10,
              ),
              Text(AppConstants.popular.tr()),
              const PopularList(),
              const CustomSpace(
                height: 10,
              ),
              Text(AppConstants.trendMovie.tr()),
              const TrendList(),
            ],
          ),
        ),
      ),
    );
  }
}
