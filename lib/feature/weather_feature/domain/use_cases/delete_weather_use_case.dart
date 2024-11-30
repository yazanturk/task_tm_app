import 'package:injectable/injectable.dart';
import 'package:task_tm_app/core/shared_use_case/shared_use_case.dart';
import 'package:task_tm_app/feature/weather_feature/domain/repositories/weather_repo.dart';

@lazySingleton
class DeleteWeatherUseCase implements SharedUseCase<bool, int> {
  final WeatherRepository weatherRepository;
  DeleteWeatherUseCase(this.weatherRepository);
  @override
  call(int params) {
    return weatherRepository.deleteWeather(params);
  }
}
