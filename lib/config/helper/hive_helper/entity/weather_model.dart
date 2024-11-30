import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 1)
class WeatherModel extends HiveObject {
  @HiveField(0)
  final List<WeatherDataHiveModel>? weathers;

  WeatherModel(this.weathers);
}

@HiveType(typeId: 2)
class WeatherDataHiveModel extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String cityName;

  @HiveField(2)
  final String temperature;

  @HiveField(3)
  final String weatherCondition;
  @HiveField(4)
  final String humidity;
  @HiveField(5)
  final String windSpeed;

  const WeatherDataHiveModel(
      {required this.id,
      required this.cityName,
      required this.weatherCondition,
      required this.humidity,
      required this.temperature,
      required this.windSpeed});

  @override
  // TODO: implement props
  List<Object?> get props => [cityName, id, weatherCondition, windSpeed, temperature];
}
