import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/features/home_screen/view_model/home_view_model.dart';
import 'package:uni_society_app/features/movie_screen/view/movie_screen.dart';
import 'package:uni_society_app/features/series_screen/view/series_screen.dart';

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
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          ref.read(homeViewModel.notifier).changeScreen(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_outlined,
                size: 25,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tv_outlined,
              ),
              label: ''),
        ],
      ),
    );
  }
}
