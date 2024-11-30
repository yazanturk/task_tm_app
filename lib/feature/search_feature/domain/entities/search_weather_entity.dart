import 'package:equatable/equatable.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';

class SearchWeatherEntity extends Equatable {
  final int? id;
  final String? cityName;
  final num? temperature;
  final String? weatherCondition;
  final num? humidity;
  final num? speedWind;

  const SearchWeatherEntity(
      {this.temperature, this.cityName, this.humidity, this.speedWind, this.weatherCondition, this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [
        cityName,
        temperature,
        weatherCondition,
        humidity,
        speedWind,
      ];
  WeatherDataHiveModel toSaveLocal() => WeatherDataHiveModel(
        weatherCondition: weatherCondition ?? '',
        humidity: humidity.toString(),
        temperature: temperature?.toString() ?? '',
        cityName: cityName?.toString() ?? '',
        id: id ?? 0,
        windSpeed: speedWind.toString(),
      );
}
