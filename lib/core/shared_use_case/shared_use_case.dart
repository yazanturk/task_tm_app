import 'package:dartz/dartz.dart';
import 'package:task_tm_app/core/network_service/error/failures.dart';

abstract class SharedUseCase<Type, Params> {
  Future<Either<Failures, Type?>> call(Params params);
}

class NoParams {}
