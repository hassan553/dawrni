/// class [ApisUrls] contains all URLs to external services, services,
/// or APIs, according to the following figure
///
/// add new APIs URL in this way:
/// EX: static const String {verb}featureName = '$_baseApiUrl/{route}';

class ApisUrls {
  /// [_baseUrl] base server url
  static const String _baseUrl = 'https://whale-app-wg8b6.ondigitalocean.app';

  /// [_baseApiUrl] base API url
  static const String _baseApiUrl = '$_baseUrl/api';

  /// [_baseImagesUrl] base Images Url
  static const String _baseImagesUrl = '$_baseUrl/uploads';
  static String baseImagesUrl(String url) => '$_baseImagesUrl/$url';

  /// Auth Feature APIs
  static const String login = '$_baseApiUrl/login/';
  static const String register = '$_baseApiUrl/register/';
  static const String verifyEmailCode= '$_baseApiUrl/verify/';

  /// Companies Feature APIs
  static String getCompanies(String parameters) => '$_baseApiUrl/companies/$parameters';
  static String getCompanyDetails(String id) =>
      '$_baseApiUrl/companies/$id';
  static String bookAppointment(String id) => '$_baseApiUrl/book_appointment/$id';

  /// Appointments Feature APIs
  static String getClientAppointments(String parameters) => '$_baseApiUrl/client_appointments/$parameters';
  static String deleteClientAppointment(String parameters) => '$_baseApiUrl/delete_appointment/$parameters';
  static String getCompanyAppointments(String parameters) => '$_baseApiUrl/company_appointments/$parameters';

  /// user Profile
  static const String getProfile = '$_baseApiUrl/profile/';

  ///Favorites Feature APIs
  static String getFavorites(String parameters) => '$_baseApiUrl/favorite_list/$parameters';
  static String addToFavorites(String parameters) => '$_baseApiUrl/favorite/$parameters';
  static String deleteFromFavorites(String parameters) => '$_baseApiUrl/favorite/$parameters';

}
