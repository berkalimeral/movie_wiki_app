import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appProvider =
    StateNotifierProvider<AppProvider, bool>((ref) => AppProvider());

class AppProvider extends StateNotifier<bool> {
  AppProvider() : super(true);

  changeLanguage(BuildContext context) {
    state = !state;
    state
        ? context.setLocale(const Locale('en'))
        : context.setLocale(const Locale('tr'));
  }
}
