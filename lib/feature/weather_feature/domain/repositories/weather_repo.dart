import 'package:dartz/dartz.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/network_service/error/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failures, List<WeatherDataHiveModel>>> getListOfWeather();
  Future<Either<Failures, bool>> deleteWeather(int weatherId);
}
