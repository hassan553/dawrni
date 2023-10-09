import 'package:dawrni/core/services/service_locator.dart';
import 'package:dio/dio.dart';

import '../constants/app_headers.dart';
import '../errors/errors_handler.dart';
import '../utils/app_response.dart';

/// This class [ApiServices] represents the basic services for call API services in the application,
/// so that all requests for Server Side services are through this same serivce.
///
/// methods:
///   1- [post] post http request
///   2- [get] get http request
///   3- [delete] delete http request
///   4- [put] put http request
///

class ApiServices {
  static ApiServices? _instance;
  ApiServices._();
  factory ApiServices() => _instance ??= ApiServices._();

  // on post request
  Future<AppResponse> post(
    String url, {
    Map<String, dynamic>? headers,
    Object? data,
  }) async {
    // logger.d(
    //     "============== POST METHOD ================= \n URL: ($url) \n Parameters: $data");
    return ErrorsHandler.exceptionThrower(
      () => Dio().post(
        url,
        data: data,
        options: Options(headers: headers ?? AppHeaders().baseHeaders),
      ),
    );
  }

  // on put request
  Future<AppResponse> put(String url,
      {Map<String, dynamic>? headers, Object? data}) async {
    // logger.d(
    //     "============== PUT METHOD ================= \n URL: ($url) \n Parameters: $data");
    return ErrorsHandler.exceptionThrower(
      () => Dio().put(
        url,
        data: data,
        options: Options(headers: headers ?? AppHeaders().baseHeaders),
      ),
    );
  }

  // on delete request
  Future<AppResponse> delete(String url,
      {Map<String, dynamic>? headers, Object? data}) async {
    // logger.d(
    //     "============== DELETE METHOD ================= \n URL: ($url) \n Parameters: $data");
    return ErrorsHandler.exceptionThrower(
      () => Dio().delete(
        url,
        data: data,
        options: Options(headers: headers ?? AppHeaders().baseHeaders),
      ),
    );
  }

  // on get request
  Future<AppResponse> get(String url,
      {Map<String, dynamic>? headers, Object? data}) async {
    // logger.d(
    //     "============== GET METHOD ================= \n URL: ($url) \n Parameters: $data");
    return ErrorsHandler.exceptionThrower(
      () => Dio().get(
        url,
        options: Options(headers: headers ?? AppHeaders().baseHeaders),
        data: data,
      ),
    );
  }
}
