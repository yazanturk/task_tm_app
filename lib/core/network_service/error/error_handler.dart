import 'package:dio/dio.dart';

import 'failures.dart';

class ErrorHandler implements Exception {
  static Failures handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    return const DefaultFailure(message: 'Error');
  }

  static Failures _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.connectionError:
        return const DefaultFailure(message: 'Connection Error, Please check your internet connection.');
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badResponse:
        return DefaultFailure(
          message: error.response?.data['message'].toString(),
        );

      default:
        return DefaultFailure(
          message: error.response?.data['message'].toString() ?? 'Error',
        );
    }
    return DefaultFailure(message: error.response?.data['message'].toString() ?? 'Error');
  }
}
