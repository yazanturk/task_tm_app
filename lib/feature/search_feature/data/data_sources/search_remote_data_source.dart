import 'package:injectable/injectable.dart';
import 'package:task_tm_app/core/network_service/api/weather_api.dart';
import 'package:task_tm_app/env.dart';
import 'package:task_tm_app/feature/search_feature/data/models/weather_data_model.dart';

abstract class SearchRemoteDataSource {
  Future<WeatherDataModel> searchWeather(String query);
}

@LazySingleton(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final WeatherServiceApi weatherApi;
  SearchRemoteDataSourceImpl(this.weatherApi);
  @override
  Future<WeatherDataModel> searchWeather(String query) async {
    return await weatherApi.getWeather(
      queries: {
        "q": query,
        'appid': Env.appId,
        "units": "metric",
      },
    );
  }
}
