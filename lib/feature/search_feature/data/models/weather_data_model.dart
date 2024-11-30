import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/feature/search_feature/data/data_sources/_mapper/mapper_entities.dart';
import 'package:task_tm_app/feature/search_feature/domain/entities/search_weather_entity.dart';

part 'weather_data_model.g.dart';

WeatherDataModel deserializeWeatherDataModel(json) => WeatherDataModel.fromJson(json);

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherDataModel extends Equatable with EntityConvertible<WeatherDataModel, SearchWeatherEntity> {
  WeatherDataModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Coord? coord;
  List<Weather>? weather;
  String? base;
  DataMain? main;
  num? visibility;
  Wind? wind;
  Clouds? clouds;
  num? dt;
  Sys? sys;
  num? timezone;
  num? id;
  String? name;
  num? cod;
  factory WeatherDataModel.fromJson(Map<String, dynamic> json) => _$WeatherDataModelFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [
        coord,
        weather,
        sys,
        id,
        name,
        clouds,
        cod,
        coord,
        wind,
        base,
        main,
        visibility,
      ];

  @override
  SearchWeatherEntity toEntity() => SearchWeatherEntity(
      cityName: name,
      id: id?.toInt() ?? 0,
      temperature: main?.temp,
      humidity: main?.humidity,
      speedWind: wind?.speed,
      weatherCondition: weather?.firstOrNull?.main);

  WeatherDataHiveModel toWeatherModel() => WeatherDataHiveModel(
      id: id?.toInt() ?? 0,
      cityName: name ?? '',
      weatherCondition: weather?.firstOrNull?.main ?? '',
      humidity: main?.humidity?.toString() ?? '',
      temperature: main?.temp?.toString() ?? '',
      windSpeed: wind?.speed?.toString() ?? '');
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  num? type;
  num? id;
  String? country;
  num? sunrise;
  num? sunset;
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Clouds {
  Clouds({
    this.all,
  });

  num? all;
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  num? speed;
  num? deg;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DataMain {
  DataMain({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? humidity;
  num? seaLevel;
  num? grndLevel;
  factory DataMain.fromJson(Map<String, dynamic> json) => _$DataMainFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  num? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  num? lon;
  num? lat;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}
