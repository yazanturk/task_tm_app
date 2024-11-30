import 'package:dartz/dartz.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/network_service/error/failures.dart';
import 'package:task_tm_app/feature/search_feature/domain/entities/search_weather_entity.dart';

abstract class SearchRepository {
  Future<Either<Failures, bool>> saveSearchWeather(WeatherDataHiveModel weather);
  Future<Either<Failures, SearchWeatherEntity>> searchWeather({required String query});
  Future<Either<Failures, bool>> removeSearch({required int weatherId});
}
