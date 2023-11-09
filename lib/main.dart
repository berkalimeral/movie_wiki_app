import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/theme/app_theme.dart';

import 'features/home_screen/view/home_screen.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  init();
  runApp(ProviderScope(
      child: EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('tr')],
    fallbackLocale: const Locale('en'),
    path: 'assets/language',
    child: const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.themeDark,
      home: const HomeScreen(),
    );
  }
}
