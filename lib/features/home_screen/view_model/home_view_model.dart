import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModel =
    StateNotifierProvider<HomeViewModel, int>((ref) => HomeViewModel());

class HomeViewModel extends StateNotifier<int> {
  HomeViewModel() : super(0);

  changeScreen(value) {
    state = value;
  }
}
