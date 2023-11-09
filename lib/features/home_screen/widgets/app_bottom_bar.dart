import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/constants/app_constants.dart';

import '../view_model/home_view_model.dart';

class AppBottomBar extends ConsumerWidget {
  const AppBottomBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        ref.read(homeViewModel.notifier).changeScreen(value);
      },
      items: [
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.movie_outlined,
              size: 25,
            ),
            label: AppConstants.movie.tr()),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.tv_outlined,
          ),
          label: AppConstants.tvSeries.tr(),
        ),
      ],
    );
  }
}
