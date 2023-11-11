/// class [ApisUrls] contains all URLs to external services, services,
/// or APIs, according to the following figure
///
/// add new APIs URL in this way:
/// EX: static const String {verb}featureName = '$_baseApiUrl/{route}';

class ApisUrls {
  /// [_baseUrl] base server url
  static const String _baseUrl = 'https://dawrniapp.azurewebsites.net';

  /// [_baseApiUrl] base API url
  static const String _baseApiUrl = '$_baseUrl/api';

  /// [_baseImagesUrl] base Images Url
  static const String _baseImagesUrl = '$_baseUrl/uploads';
  static String baseImagesUrl(String url) => '$_baseImagesUrl/$url';

  /// Auth Feature APIs
  static const String login = '$_baseApiUrl/auth/login';
  static const String register = '$_baseApiUrl/auth/register';
  static const String verifyEmailCode= '$_baseApiUrl/verify';

  /// Category Feature APIs
  static String getCategories(String id) =>
      '$_baseApiUrl/categories/section/$id?lang=en';
}
