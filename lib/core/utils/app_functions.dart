class AppFunctions {
  static AppFunctions? _instance;
  AppFunctions._();

  factory AppFunctions() => _instance ??= AppFunctions._();
  String generateCountryFlag() {
    String countryCode = 'kw';

    String flag = countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );

    return flag;
  }
}