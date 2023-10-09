import 'package:dawrni/core/services/service_locator.dart';
import 'package:dio/dio.dart';

/// This class, [AppResponse], expresses the form of the response received from the services,
/// so that it contains a factory that deals with the Dio response,
/// so that this class ensures that information is received from the Dio library and transformed into a special form.
/// (the main use of this type of thinking is the possibilitythat
/// subsequent developers will want to change the library Communicate with API, like: "http")
///
/// [data] : the received information
/// [headers] : http headers
/// [statusCode] : Http request status code

class AppResponse {
  final dynamic data;
  final Map<String, String> headers;
  final int? statusCode;

  AppResponse({
    this.statusCode,
    required this.headers,
    this.data,
  });

  /// this factory convert Dio [Response] to [AppResponse]
  factory AppResponse.fromDioResponse(Response response) {
    // logger.d(response.data);
    return AppResponse(
      statusCode: response.statusCode,
      headers:
          response.headers.map.map((key, value) => MapEntry(key, value.first)),
      data: response.data,
    );
  }

  /// any lib Reponse factory should created here
  /// ...
}
