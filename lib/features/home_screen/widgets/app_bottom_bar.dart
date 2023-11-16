import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/theme/custom_colors.dart';

import '../view_model/home_view_model.dart';

class AppBottomBar extends ConsumerWidget {
  const AppBottomBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;
  final List<IconData> _icons = const [
    Icons.movie_outlined,
    Icons.tv_outlined,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedBottomNavigationBar(
      icons: _icons,
      backgroundColor: CustomColorsDark.background,
      activeColor: CustomColorsDark.surface,
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (value) {
        ref.read(homeViewModel.notifier).changeScreen(value);
      },
    );
  }
}

/**
 * return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        ref.read(homeViewModel.notifier).changeScreen(value);
      },
      items: [
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.movie_outlined,
              size: 25,
            ),
            label: AppLocalizations.of(context)?.movie),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.tv_outlined,
          ),
          label: AppLocalizations.of(context)?.tvSeries,
        ),
      ],
    );
 */
