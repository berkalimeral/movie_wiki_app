import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            label: AppLocalizations.of(context)?.movie),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.tv_outlined,
          ),
          label: AppLocalizations.of(context)?.tvSeries,
        ),
      ],
    );
  }
}
