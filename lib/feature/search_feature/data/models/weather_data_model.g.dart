// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataModel _$WeatherDataModelFromJson(Map<String, dynamic> json) =>
    WeatherDataModel(
      coord: json['coord'] == null
          ? null
          : Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String?,
      main: json['main'] == null
          ? null
          : DataMain.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as num?,
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as num?,
      sys: json['sys'] == null
          ? null
          : Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as num?,
      id: json['id'] as num?,
      name: json['name'] as String?,
      cod: json['cod'] as num?,
    );

Map<String, dynamic> _$WeatherDataModelToJson(WeatherDataModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      type: json['type'] as num?,
      id: json['id'] as num?,
      country: json['country'] as String?,
      sunrise: json['sunrise'] as num?,
      sunset: json['sunset'] as num?,
    );

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) => Clouds(
      all: json['all'] as num?,
    );

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

Wind _$WindFromJson(Map<String, dynamic> json) => Wind(
      speed: json['speed'] as num?,
      deg: json['deg'] as num?,
    );

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };

DataMain _$DataMainFromJson(Map<String, dynamic> json) => DataMain(
      temp: json['temp'] as num?,
      feelsLike: json['feels_like'] as num?,
      tempMin: json['temp_min'] as num?,
      tempMax: json['temp_max'] as num?,
      pressure: json['pressure'] as num?,
      humidity: json['humidity'] as num?,
      seaLevel: json['sea_level'] as num?,
      grndLevel: json['grnd_level'] as num?,
    );

Map<String, dynamic> _$DataMainToJson(DataMain instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.grndLevel,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      id: json['id'] as num?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
      lon: json['lon'] as num?,
      lat: json['lat'] as num?,
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
