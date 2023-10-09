import 'package:dawrni/main.dart';

const kIsArabic = 'isArabic';
final isArabic = sharedPreferences.getBool(kIsArabic) ?? false;
String generateCountryFlag() {
  String countryCode = 'kw';

  String flag = countryCode.toUpperCase().replaceAllMapped(
    RegExp(r'[A-Z]'),
    (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
  );

  return flag;
}