import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';

abstract class LocalDataBase {
  void getListOfWeatherFromLocally();
  Future<bool> saveWeatherData(WeatherModel weather);
}
