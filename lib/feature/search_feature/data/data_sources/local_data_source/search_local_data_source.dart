import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';

abstract class SearchLocalDataSource {
  Future<bool> saveWeatherData(WeatherDataHiveModel weather);
  Future<bool> removeSearch(int weatherId);
}

@LazySingleton(as: SearchLocalDataSource)
class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  @override
  Future<bool> saveWeatherData(WeatherDataHiveModel weather) async {
    var boxHive = Hive.box<WeatherModel>('weather');
    final List<WeatherDataHiveModel> listOfWeather = boxHive.get(0)?.weathers ?? [];
    listOfWeather.insert(0, weather);

    await boxHive.put(0, WeatherModel(listOfWeather.toSet().toList()));

    return true;
  }

  @override
  Future<bool> removeSearch(int weatherId) async {
    try {
      var boxHive = Hive.box<WeatherModel>('weather');

      final List<WeatherDataHiveModel> listOfWeather = boxHive.get(0)?.weathers ?? [];

      var index = listOfWeather.indexWhere((element) => element.id.toString() == weatherId.toString());

      listOfWeather.removeAt(index);

      await boxHive.put(0, WeatherModel(listOfWeather));

      return true;
    } catch (e) {
      return false;
    }
  }
}
