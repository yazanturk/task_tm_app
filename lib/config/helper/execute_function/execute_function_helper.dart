import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_tm_app/core/network_service/error/error_handler.dart';
import 'package:task_tm_app/core/network_service/error/failures.dart';

Future<Either<Failures, T>> executeAndCatchError<T>(Future<T> Function() function) async {
  try {
    final result = await function();
    return Right(result);
  } on DioException catch (e) {
    return Left(ErrorHandler.handleError(e));
  }
}
