import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_society_app/core/theme/app_theme.dart';
import 'package:uni_society_app/products/providers/app_provider/app_provider.dart';

import 'features/home_screen/view/home_screen.dart';
import 'l10n/repository/language_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final language = await container.read(languageRepoProvider).getLanguage();
  runApp(ProviderScope(
    overrides: [appProvider.overrideWith((ref) => language)],
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(appProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(watch.code),
      theme: AppTheme.themeDark,
      home: const HomeScreen(),
    );
  }
}
