import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/language/language.dart';
import '../../products/providers/app_provider/app_provider.dart';

class LanguageRepo {
  LanguageRepo({required this.ref});

  Ref ref;

  static const String languageCodeKey = 'language_code';

  Future<void> setLanguage(Language language) async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    await pref.setString(languageCodeKey, language.code);
    ref.read(appProvider.notifier).update((state) => language);
  }

  Future<Language> getLanguage() async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    final code = pref.getString(languageCodeKey);
    for (var value in Language.values) {
      if (value.code == code) {
        return value;
      }
    }
    return Language.english;
  }
}

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());

final languageRepoProvider =
    Provider<LanguageRepo>((ref) => LanguageRepo(ref: ref));
