import 'package:dawrni/core/enums/app_languages.dart';

extension StringToAppLanguage on String {
  // TODO: Customize app button decoration properties here

  AppLanguages get toAppLanguage {
    switch (this) {
      case 'ar':
        return AppLanguages.arabic;
      case 'en':
        return AppLanguages.english;
      default:
        throw "No Such Language";
    }
  }

}