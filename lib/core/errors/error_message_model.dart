import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// This class [ErrorMessageModel] is defined as the appropriate format for returning error messages from the backend,
/// in an appropriate manner so that the model is received in the interface in a form ready for display.

class ErrorMessageModel extends Equatable {
  final String statusMessage;
  final int? statusCode;
  const ErrorMessageModel({
    required this.statusMessage,
    this.statusCode,
  });

  /// In the existing factory constartor you can assign the path to
  /// the possible [statusMessage] error message returning from the backend.
  /// Ex: statusMessage : response.data['message'] ?? response['error']['message']
  
  factory ErrorMessageModel.fromJson(Response response) {
    return ErrorMessageModel(
      statusMessage:
          response.data['message'] ?? response.data['error']['message'],
      statusCode: response.statusCode,
    );
  }

  @override
  List<Object?> get props => [statusMessage, statusCode];
}
