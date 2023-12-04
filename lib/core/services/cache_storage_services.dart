import 'package:dawrni/core/enums/user_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [CacheStorageServices] services express services related to storing variables in the cache
/// By defining a [_Keys] variable suitable for the value to be stored, and defining the following 4 methods,
/// you will be able to store any value in memory via these services.
/// 1- [setValue] to store value in cache
///    Future<void> setValue(String value) async => await _preferences?.setString(_Keys.value, value)
/// 2- [removeValue] to remove value from cache
///    Future<void> removeValue() async => await _preferences?.remove(_Keys.value);
/// 3- [value] to get value from cache
///    String? get value => _preferences?.getString(_Keys.value) ?? null;
/// 4- [hasValue] check if this variable stored or not
///    bool get hasValue => _preferences?.containsKey(_Keys.value) ?? false;
///
/// It is important to call [CacheStorageServices.init] in the main.dart file before the [runApp] function
/// await CacheStorageServices.init();

class CacheStorageServices {
  static CacheStorageServices? _instance;
  static SharedPreferences? _preferences;

  CacheStorageServices._();

  factory CacheStorageServices() => _instance ??= CacheStorageServices._();

  // should call init in your main before run app
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setLocale(String locale) async =>
      await _preferences?.setString(_Keys.locale, locale);

  String? get locale => _preferences?.getString(_Keys.locale);

  Future setUserType(UserType userType) async {
    await _preferences?.setString( _Keys.userType, userType.type.toString());
  }

  UserType? getUserType() {
    return _preferences?.getString(_Keys.userType)?.toUserType();
  }

  bool get isClient => _preferences?.getString(_Keys.userType)?.toUserType() == UserType.client;

  bool get isCompany => _preferences?.getString(_Keys.userType)?.toUserType() == UserType.company;

  ///
  Future<void> setToken(String token) async => await _preferences?.setString(_Keys.token, token);

  Future<void> removeToken() async => await _preferences?.remove(_Keys.token);

  bool get hasToken => _preferences?.containsKey(_Keys.token) ?? false;

  String get token => _preferences?.getString(_Keys.token) ?? 'no token';

  Future setFirstLaunch() async {
    await _preferences?.setBool( _Keys.firstLaunch, false);
  }

  bool get firstLaunch => _preferences?.getBool(_Keys.firstLaunch) ?? true;

  Future clearAll() async {
    await _preferences?.remove(_Keys.token);
    await _preferences?.remove(_Keys.userType);
    await _preferences?.remove(_Keys.email);
  }

  Future<void> setEmail(String email) async => await _preferences?.setString(_Keys.email, email);

  String get email => _preferences?.getString(_Keys.email) ?? 'no email';

}

class _Keys {
  static const String locale = 'locale';
  static const String firstLaunch = 'firstLaunch';
  static const String token = 'token';
  static const String userType = 'userType';
  static const String email = 'email';
}
