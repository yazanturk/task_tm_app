import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/shared_use_case/shared_use_case.dart';
import 'package:task_tm_app/feature/search_feature/domain/repositories/search_repo.dart';

@lazySingleton
class SaveSearchWeatherUseCase implements SharedUseCase<bool, WeatherDataHiveModel> {
  final SearchRepository searchRepository;
  SaveSearchWeatherUseCase(this.searchRepository);
  @override
  call(WeatherDataHiveModel params) {
    return searchRepository.saveSearchWeather(params);
  }
}
