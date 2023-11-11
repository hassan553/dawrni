import 'package:dawrni/core/extension/language_extenstions/app_languages_extenstion.dart';
import 'package:dawrni/core/extension/string_extenstions/string_to_app_language.dart';
import 'package:dawrni/core/services/cache_storage_services.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../enums/app_languages.dart';

/// Class [AppLocale] that handles localization logic in the app
class AppLocale {
  static AppLocale? _instance;
  AppLocale._();
  final String defaultLocale = 'en';

  factory AppLocale() => _instance ??= AppLocale._();

  // Returns the current language based on the context locale
  AppLanguages currentLanguage() {
    //If the context locale is Arabic, return the Arabic language

    return (CacheStorageServices().locale ?? defaultLocale).toAppLanguage;
  }

  // Returns a list of supported locales in the app, containing the English and Arabic locales
  List<Locale> get supportedLocales => AppLanguages.values.map((e) => e.locale).toList();

  // Changes the language based on the provided AppLanguages enum value
   Future<void> setLocale(AppLanguages locale) async {
    if (currentLanguage() == locale) return;
    await S.load(locale.locale);
    await CacheStorageServices().setLocale(locale.stringify);
  }

  // Checks if the current language is English
  bool isEnglish() =>
      currentLanguage() == AppLanguages.english;

  // Checks if the current language is Arabic
  bool isArabic() =>
      currentLanguage() == AppLanguages.arabic;
}
