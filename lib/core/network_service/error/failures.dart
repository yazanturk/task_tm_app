import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final int? code;
  final String? message;
  const Failures({this.code, this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [
        code,
        message,
      ];
}

class ServerFailure extends Failures {}

class CacheFailure extends Failures {
  const CacheFailure({String? errorMessage}) : super(message: errorMessage);
}

class DefaultFailure extends Failures {
  const DefaultFailure({super.code, super.message});
}
