import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/app_constant/app_strings.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/config/helper/hive_helper/hive_database.dart';

abstract class WeatherLocalDataSource {
  Future<List<WeatherDataHiveModel>> getListOfWeatherFromLocally();
  Future<bool> deleteWeather(int weatherId);
}

@LazySingleton(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final HiveCacheHelper hiveCacheHelper;
  WeatherLocalDataSourceImpl(this.hiveCacheHelper);

  @override
  Future<List<WeatherDataHiveModel>> getListOfWeatherFromLocally() async {
    final data = await hiveCacheHelper.getDataById<WeatherModel>(0, AppStrings.weatherBox);
    final List<WeatherDataHiveModel> listOfWeather = data?.weathers ?? [];
    return listOfWeather.toSet().toList();
  }

  @override
  Future<bool> deleteWeather(int weatherId) async {
    final data = await hiveCacheHelper.getDataById<WeatherModel>(0, AppStrings.weatherBox);
    final List<WeatherDataHiveModel> listOfWeather = data?.weathers ?? [];
    listOfWeather.removeWhere((element) {
      return element.id.toString() == weatherId.toString();
    });
    WeatherModel weatherModel = WeatherModel(listOfWeather);
    hiveCacheHelper.putData(weatherModel, AppStrings.weatherBox);
    return true;
  }
}
