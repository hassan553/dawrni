//! backend exception
import 'error_message_model.dart';

/// In this file, you will find a set of expected exceptions according to the use cases found in the base project v2.
/// You can add any [Exception] that is likely to occur within this file.
///

///! server exception
/// This type of Exception [NoInternetException] is thrown if any errors occur from the server side
class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException(this.errorMessageModel);
}

///! no internet exception
/// This type of Exception [NoInternetException] is thrown if any connection problems occur
/// or internet services stop on the phone
class NoInternetException implements Exception {
  final String message = 'exception: No Internet Connection';
  NoInternetException();
}

///! un known exception
/// This type of Exception [UnknownException] is thrown if any unexpected errors occur
class UnknownException implements Exception {
  final String message;
  UnknownException({this.message = 'exception: An Error Occured'});
}

///!  app version is invalid
/// This type of [Exception] is thrown if an error occurs related to the current version of the application
/// in addition to any errors related to the user’s use of the current version.
class ForceUpdateException implements Exception {
  final String message;
  ForceUpdateException({this.message = 'exception: Force Update'});
}

///! app is under maintaince or check app version failed
/// This type of Exception [AppUnderMaintenanceException] is thrown if the application's server is under repair or 
/// if there are any errors related to the temporary cessation of server side services.
class AppUnderMaintenanceException implements Exception {
  final String message;
  AppUnderMaintenanceException({this.message = 'exception: Maintaenance Mode'});
}

///! refresh token is invalid
/// This type of Exception [SessionExpiredException] is thrown if the user's token session expires
class SessionExpiredException implements Exception {
  final String message;
  SessionExpiredException({this.message = 'exception: Session Expired'});
}

///! can not parse response
/// This type of Exception [ParsingException] is thrown if there are problems with the type or converting between types,
/// or if a variable of type [x] was expected and a variable of type [y] was assigned.
class ParsingException implements Exception {
  final String message;
  final String parsingMessage;
  ParsingException({
    this.message = 'exception: can not parse response',
    required this.parsingMessage,
  });
  @override
  String toString() => "$message ($parsingMessage)";
}
