import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/app_constant/app_strings.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/config/helper/hive_helper/hive_database.dart';

abstract class SearchLocalDataSource {
  Future<bool> saveWeatherData(WeatherDataHiveModel weather);
  Future<bool> removeSearch(int weatherId);
}

@LazySingleton(as: SearchLocalDataSource)
class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final HiveCacheHelper hiveCacheHelper;

  SearchLocalDataSourceImpl(this.hiveCacheHelper);

  @override
  Future<bool> saveWeatherData(WeatherDataHiveModel weather) async {
    final data = await hiveCacheHelper.getDataById<WeatherModel>(0, AppStrings.weatherBox);
    final List<WeatherDataHiveModel> listOfWeather = data?.weathers ?? [];
    listOfWeather.insert(0, weather);

    await hiveCacheHelper.putData(WeatherModel(listOfWeather.toSet().toList()), AppStrings.weatherBox);

    return true;
  }

  @override
  Future<bool> removeSearch(int weatherId) async {
    try {
      final data = await hiveCacheHelper.getDataById<WeatherModel>(0, AppStrings.weatherBox);

      final List<WeatherDataHiveModel> listOfWeather = data?.weathers ?? [];

      var index = listOfWeather.indexWhere((element) => element.id.toString() == weatherId.toString());

      listOfWeather.removeAt(index);

      await hiveCacheHelper.putData(WeatherModel(listOfWeather), AppStrings.weatherBox);

      return true;
    } catch (e) {
      return false;
    }
  }
}
