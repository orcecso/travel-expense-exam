import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});
}

ApiException mapDioException(DioException exception) {
  final statusCode = exception.response?.statusCode;
  final responseData = exception.response?.data;
  var message = 'Unable to complete the request.';

  if (responseData is Map<String, dynamic>) {
    final responseMessage = responseData['message'];
    if (responseMessage is String && responseMessage.isNotEmpty) {
      message = responseMessage;
    }
  } else if (exception.message != null && exception.message!.isNotEmpty) {
    message = exception.message!;
  }

  return ApiException(message, statusCode: statusCode);
}
