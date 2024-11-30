import 'package:flutter/material.dart';
import 'package:flutter_provider_utilities/flutter_provider_utilities.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/feature/search_feature/domain/entities/search_weather_entity.dart';
import 'package:task_tm_app/feature/search_feature/domain/use_cases/get_search_weather_use_case.dart';
import 'package:task_tm_app/feature/search_feature/domain/use_cases/remove_search_weather_use_case.dart';
import 'package:task_tm_app/feature/search_feature/domain/use_cases/save_search_weather_use_case.dart';

enum SearchStatus { init, loading, error, loaded }

class SearchProvider extends ChangeNotifier with MessageNotifierMixin {
  final GetSearchWeatherUseCase getSearchWeatherUseCase;
  final SaveSearchWeatherUseCase saveSearchWeatherUseCase;
  final RemoveSearchWeatherUseCase deleteWeatherUseCase;
  SearchProvider(this.getSearchWeatherUseCase, this.saveSearchWeatherUseCase, this.deleteWeatherUseCase);
  SearchWeatherEntity searchWeatherEntity = SearchWeatherEntity();
  SearchStatus searchStatus = SearchStatus.init;
  String errorMessage = '';
  Future<void> searchWeather(String query) async {
    if (query.isEmpty) {
      updateStatus(SearchStatus.init);
      return;
    }
    updateStatus(SearchStatus.loading);
    final res = await getSearchWeatherUseCase.call(query);
    res.fold((left) {
      errorMessage = left.message.toString();
      updateStatus(SearchStatus.error);
    }, (weather) {
      searchWeatherEntity = weather!;
      updateStatus(SearchStatus.loaded);
    });
  }

  Future<void> saveSearch(WeatherDataHiveModel weatherData) async {
    final res = await saveSearchWeatherUseCase.call(weatherData);
    res.fold((error) {
      notifyInfo('Error Save Item');
    }, (saved) {
      notifyInfo('Successfully Saved');
    });
  }

  Future<void> removeItem(int weatherId) async {
    final res = await deleteWeatherUseCase.call(weatherId);
    res.fold((error) {
      notifyInfo('Error Delete Item');
    }, (saved) {
      notifyInfo('Successfully Removed');
    });
  }

  updateStatus(SearchStatus newSearchStatus) {
    searchStatus = newSearchStatus;
    notifyListeners();
  }
}
