import 'package:flutter/material.dart';

import 'package:uni_society_app/assets.dart';

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
              TrendList(),
            ],
          ),
        ),
      ),
    );
  }
}
