import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/helper/execute_function/execute_function_helper.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/network_service/error/failures.dart';
import 'package:task_tm_app/feature/search_feature/data/data_sources/local_data_source/search_local_data_source.dart';
import 'package:task_tm_app/feature/search_feature/data/data_sources/search_remote_data_source.dart';
import 'package:task_tm_app/feature/search_feature/domain/entities/search_weather_entity.dart';
import 'package:task_tm_app/feature/search_feature/domain/repositories/search_repo.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;
  SearchRepositoryImpl(this.searchLocalDataSource, this.searchRemoteDataSource);

  @override
  Future<Either<Failures, bool>> saveSearchWeather(WeatherDataHiveModel weather) {
    return executeAndCatchError(() => searchLocalDataSource.saveWeatherData(weather));
  }

  @override
  Future<Either<Failures, SearchWeatherEntity>> searchWeather({required String query}) {
    return executeAndCatchError(() async {
      final res = await searchRemoteDataSource.searchWeather(query);

      return res.toEntity();
    });
  }

  @override
  Future<Either<Failures, bool>> removeSearch({required int weatherId}) {
    return executeAndCatchError(() => searchLocalDataSource.removeSearch(weatherId));
  }
}
