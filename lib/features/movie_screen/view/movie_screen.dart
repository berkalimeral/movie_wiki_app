import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/attributes/attributes.dart';
import '../../../core/widgets/custom_space.dart';

import '../widgets/now_playing_card.dart';
import '../widgets/popular_list_card.dart';
import '../widgets/trending_list_card.dart';

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
              Text(AppLocalizations.of(context)!.nowPlaying),
              const CustomSpace(
                height: 10,
              ),
              const NowPlayingSlider(),
              const CustomSpace(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.popular),
              const PopularList(),
              const CustomSpace(
                height: 10,
              ),
              Text(AppLocalizations.of(context)!.trendMovie),
              const TrendList(),
            ],
          ),
        ),
      ),
    );
  }
}
