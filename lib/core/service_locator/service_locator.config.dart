// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/search_feature/data/data_sources/local_data_source/search_local_data_source.dart'
    as _i1064;
import '../../feature/search_feature/data/data_sources/search_remote_data_source.dart'
    as _i850;
import '../../feature/search_feature/data/repositories/search_repo_impl.dart'
    as _i271;
import '../../feature/search_feature/domain/repositories/search_repo.dart'
    as _i916;
import '../../feature/search_feature/domain/use_cases/get_search_weather_use_case.dart'
    as _i878;
import '../../feature/search_feature/domain/use_cases/remove_search_weather_use_case.dart'
    as _i871;
import '../../feature/search_feature/domain/use_cases/save_search_weather_use_case.dart'
    as _i761;
import '../../feature/weather_feature/data/data_sources/local_data_source/weather_local_data_source.dart'
    as _i496;
import '../../feature/weather_feature/data/repositories/weather_repo_impl.dart'
    as _i872;
import '../../feature/weather_feature/domain/repositories/weather_repo.dart'
    as _i319;
import '../../feature/weather_feature/domain/use_cases/delete_weather_use_case.dart'
    as _i459;
import '../../feature/weather_feature/domain/use_cases/get_weather_use_case.dart'
    as _i832;
import '../network_service/api/weather_api.dart' as _i727;
import '../network_service/dio_factory/dio_factory.dart' as _i115;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioFactory = _$DioFactory();
    gh.lazySingleton<_i361.Dio>(() => dioFactory.getDioFactory());
    gh.lazySingleton<_i496.WeatherLocalDataSource>(
        () => _i496.WeatherLocalDataSourceImpl());
    gh.lazySingleton<_i1064.SearchLocalDataSource>(
        () => _i1064.SearchLocalDataSourceImpl());
    gh.factory<_i727.WeatherServiceApi>(
        () => _i727.WeatherServiceApi(gh<_i361.Dio>()));
    gh.lazySingleton<_i319.WeatherRepository>(
        () => _i872.WeatherRepositoryImpl(gh<_i496.WeatherLocalDataSource>()));
    gh.lazySingleton<_i850.SearchRemoteDataSource>(
        () => _i850.SearchRemoteDataSourceImpl(gh<_i727.WeatherServiceApi>()));
    gh.lazySingleton<_i832.GetWeatherUseCase>(
        () => _i832.GetWeatherUseCase(gh<_i319.WeatherRepository>()));
    gh.lazySingleton<_i459.DeleteWeatherUseCase>(
        () => _i459.DeleteWeatherUseCase(gh<_i319.WeatherRepository>()));
    gh.lazySingleton<_i916.SearchRepository>(() => _i271.SearchRepositoryImpl(
          gh<_i1064.SearchLocalDataSource>(),
          gh<_i850.SearchRemoteDataSource>(),
        ));
    gh.lazySingleton<_i871.RemoveSearchWeatherUseCase>(
        () => _i871.RemoveSearchWeatherUseCase(gh<_i916.SearchRepository>()));
    gh.lazySingleton<_i878.GetSearchWeatherUseCase>(
        () => _i878.GetSearchWeatherUseCase(gh<_i916.SearchRepository>()));
    gh.lazySingleton<_i761.SaveSearchWeatherUseCase>(
        () => _i761.SaveSearchWeatherUseCase(gh<_i916.SearchRepository>()));
    return this;
  }
}

class _$DioFactory extends _i115.DioFactory {}
