import 'package:injectable/injectable.dart';
import 'package:task_tm_app/core/shared_use_case/shared_use_case.dart';
import 'package:task_tm_app/feature/search_feature/domain/entities/search_weather_entity.dart';
import 'package:task_tm_app/feature/search_feature/domain/repositories/search_repo.dart';

@lazySingleton
class GetSearchWeatherUseCase implements SharedUseCase<SearchWeatherEntity, String> {
  final SearchRepository searchRepository;
  GetSearchWeatherUseCase(this.searchRepository);
  @override
  call(String params) {
    return searchRepository.searchWeather(query: params);
  }
}
