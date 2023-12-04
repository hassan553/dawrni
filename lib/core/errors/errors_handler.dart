import 'package:dawrni/core/entities/base_entity.dart';
import 'package:dawrni/core/models/base_model.dart';
import 'package:dawrni/core/services/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../utils/app_response.dart';
import 'error_message_model.dart';
import 'exception.dart';
import 'failure.dart';

/// The method of type: [FutureFunction] expresses a waiting condition of type Generic
/// The method of type: [RequestFunction] expresses a waiting condition of type Dio [Response]
typedef FutureFunction<T> = Future<T> Function();
typedef RequestFunction<T> = Future<Response<T>> Function();

/// class [ErrorsHandler] defaine as Global Exception Handler,
/// [exceptionThrower] handles throw cases of exception according to the application's use cases,
/// [handleEither] handles possible errors and converting to either form.

class ErrorsHandler {
// this function to handle APIs exception this make you don't have to call any try catch in your code
  static Future<AppResponse> exceptionThrower(RequestFunction function) async {
    try {
      /// call Future function and return [AppResponse]
      final response = await function();
      return AppResponse.fromDioResponse(response);
    } on DioException catch (e) {
      // check on Dio Exception
      // logger.e(
      //     "==================== Dio Exception ====================== \n ${e.toString()} \n ${e.response?.data}");

      if(e.response?.statusCode == 401) {
        throw SessionExpiredException();
      }

      // if back end return an error response and its json format
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        throw ServerException(ErrorMessageModel.fromJson(e.response!));
      }

      // any anther throws to any anther exception types showld be here
      // ...

      // un known Exception
      if (e.response != null) {
        throw UnknownException();
      }

      // no internet Exception
      throw NoInternetException();
    } catch (e) {
      // logger.d(
      //     "================== Exception ======================  \n ${e.toString()} \n ${e.runtimeType}");

      // in json parsion error
      if (e is TypeError) {
        throw ParsingException(parsingMessage: e.toString());
      }

      rethrow;
    }
  }

  // this function check possible exceptions and return either (left as Failure , right as Type you generic send)
  static Future<Either<Failure, T>>
  handleEither<T extends BaseEntity, M extends BaseModel>(
      FutureFunction<M> future,
      ) async {
    try {
      /// first call your [FutureFunction] function
      final result = await future();
      return Right(result.toEntity() as T);
    } catch (e) {
      /// then catch any errors + check types then return [Left] appropriate [Failure]

      return Left(failureThrower(e));
    }
  }

  static Failure failureThrower(Object e) {
    if (e is ServerException) {
      return ServerFailure(
        e.errorMessageModel.statusMessage,
        statusCode: e.errorMessageModel.statusCode,
      );
    }
    if (e is NoInternetException) {
      return NoInternetFailure();
    }
    if (e is UnknownException) {
      return UnknownFailure();
    }
    if (e is ForceUpdateException) {
      return ForceUpdateFailure();
    }
    if (e is AppUnderMaintenanceException) {
      return AppUnderMaintenanceFailure();
    }
    if (e is SessionExpiredException) {
      return SessionExpiredFailure();
    }
    if (e is ParsingException || e is TypeError) {
      return ParsingFailure(
        parsingMessage: e is ParsingException ? e.parsingMessage : e.toString(),
      );
    }
    return Failure(e.toString());
  }
}
