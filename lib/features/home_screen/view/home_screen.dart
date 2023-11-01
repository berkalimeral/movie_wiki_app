import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uni_society_app/assets.dart';
import 'package:uni_society_app/core/constants/app_constants.dart';
import 'package:uni_society_app/core/extensions/extensions.dart';
import 'package:uni_society_app/core/utils/attributes/attributes.dart';

import '../../../core/widgets/custom_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          return Container(
            width: 150,
            margin: EdgeInsets.all(Attributes().cardPadding),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius:
                  BorderRadius.circular(Attributes().cardBorderRadius),
            ),
          );
        },
      ),
    );
  }
}

class NowPlayingSlider extends StatelessWidget {
  const NowPlayingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, realIndex) {
        return Container(
          height: 250,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(Attributes().cardBorderRadius),
          ),
        );
      },
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        viewportFraction: .5,
        enlargeCenterPage: true,
        pageSnapping: true,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
