import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<List<WeatherDataHiveModel>> getListOfWeatherFromLocally();
  Future<bool> deleteWeather(int weatherId);
}

@LazySingleton(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  @override
  Future<List<WeatherDataHiveModel>> getListOfWeatherFromLocally() async {
    var boxHive = Hive.box<WeatherModel>('weather');
    final List<WeatherDataHiveModel> listOfWeather = boxHive.get(0)?.weathers ?? [];
    return listOfWeather.toSet().toList();
  }

  @override
  Future<bool> deleteWeather(int weatherId) async {
    var boxHive = Hive.box<WeatherModel>('weather');
    final List<WeatherDataHiveModel> listOfWeather = boxHive.get(0)?.weathers ?? [];
    listOfWeather.removeWhere((element) {
      return element.id.toString() == weatherId.toString();
    });
    WeatherModel weatherModel = WeatherModel(listOfWeather);
    boxHive.put(0, weatherModel);
    return true;
  }
}
