import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../movie_screen/view/movie_screen.dart';
import '../../series_screen/view/series_screen.dart';
import '../view_model/home_view_model.dart';
import '../widgets/app_bottom_bar.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_app_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<Widget> screens = const [MovieScreen(), SeriesScreen()];

  @override
  Widget build(BuildContext context) {
    int currentIndex = ref.watch(homeViewModel);
    return Scaffold(
      appBar: const HomeAppBar(),
      drawer: const AppDrawer(),
      body: screens[currentIndex],
      bottomNavigationBar: AppBottomBar(
        currentIndex: currentIndex,
      ),
    );
  }
}
