import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/shared_use_case/shared_use_case.dart';
import 'package:task_tm_app/feature/weather_feature/domain/repositories/weather_repo.dart';

@lazySingleton
class GetWeatherUseCase implements SharedUseCase<List<WeatherDataHiveModel>, NoParams> {
  final WeatherRepository weatherRepository;
  GetWeatherUseCase(this.weatherRepository);
  @override
  call(NoParams params) {
    return weatherRepository.getListOfWeather();
  }
}
