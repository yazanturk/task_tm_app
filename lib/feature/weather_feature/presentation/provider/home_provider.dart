import 'package:flutter/material.dart';
import 'package:flutter_provider_utilities/flutter_provider_utilities.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/shared_use_case/shared_use_case.dart';
import 'package:task_tm_app/feature/weather_feature/domain/use_cases/delete_weather_use_case.dart';
import 'package:task_tm_app/feature/weather_feature/domain/use_cases/get_weather_use_case.dart';

enum GetStatusWeathers { init, loading, loaded, error }

class HomeProvider extends ChangeNotifier with MessageNotifierMixin {
  final DeleteWeatherUseCase deleteWeatherUseCase;
  final GetWeatherUseCase getWeatherUseCase;

  HomeProvider(this.getWeatherUseCase, this.deleteWeatherUseCase);

  WeatherModel weatherModel = WeatherModel([]);
  GetStatusWeathers statusWeathers = GetStatusWeathers.init;
  Future<void> getListOfWeathers() async {
    final res = await getWeatherUseCase(NoParams());
    res.fold((error) {
      statusWeathers = GetStatusWeathers.error;
      notifyListeners();
    }, (weathers) {
      weatherModel.weathers?.clear();
      weatherModel.weathers?.addAll(weathers ?? []);
      statusWeathers = GetStatusWeathers.loaded;
      notifyListeners();
    });
  }

  bool isDelete = false;
  Future<void> deleteWeather(int index) async {
    isDelete = false;
    final res = await deleteWeatherUseCase(weatherModel.weathers?[index].id ?? 0);
    if (res.isRight()) {
      weatherModel.weathers?.removeAt(index);
      isDelete = true;

      notifyInfo('Successfully Deleted');

      notifyListeners();
    } else {
      notifyError('Error fro Delete Items');
    }
  }
}
