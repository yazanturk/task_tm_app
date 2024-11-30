import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/helper/execute_function/execute_function_helper.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/network_service/error/failures.dart';
import 'package:task_tm_app/feature/weather_feature/data/data_sources/local_data_source/weather_local_data_source.dart';
import 'package:task_tm_app/feature/weather_feature/domain/repositories/weather_repo.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherLocalDataSource localDataSource;
  WeatherRepositoryImpl(this.localDataSource);
  @override
  Future<Either<Failures, bool>> deleteWeather(int weatherId) {
    return executeAndCatchError(() => localDataSource.deleteWeather(weatherId));
  }

  @override
  Future<Either<Failures, List<WeatherDataHiveModel>>> getListOfWeather() {
    return executeAndCatchError(() => localDataSource.getListOfWeatherFromLocally());
  }
}
