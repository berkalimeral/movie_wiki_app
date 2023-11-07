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
            children: const [
              Text(nowPlaying),
              CustomSpace(
                height: 10,
              ),
              NowPlayingSlider(),
              CustomSpace(
                height: 10,
              ),
              Text(popular),
              PopularList(),
              CustomSpace(
                height: 10,
              ),
              Text(trendMovie),
              TrendList(),
            ],
          ),
        ),
      ),
    );
  }
}
