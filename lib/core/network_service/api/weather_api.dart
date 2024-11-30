import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task_tm_app/core/endpoint/end_point.dart';
import 'package:task_tm_app/feature/search_feature/data/models/weather_data_model.dart';

part 'weather_api.g.dart';

@injectable
@RestApi(parser: Parser.FlutterCompute)
abstract class WeatherServiceApi {
  @factoryMethod
  factory WeatherServiceApi(Dio dio) = _WeatherServiceApi;

  @GET(EndPoint.searchWeather)
  Future<WeatherDataModel> getWeather({@Queries() required Map<String, dynamic> queries});
}
