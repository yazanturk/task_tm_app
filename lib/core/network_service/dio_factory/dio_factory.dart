import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_tm_app/core/endpoint/end_point.dart';

@module
abstract class DioFactory {
  DioFactory();

  @lazySingleton
  Dio getDioFactory() {
    final client = Dio();

    client.options
      ..baseUrl = EndPoint.baseUrl
      ..connectTimeout = Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..responseType = ResponseType.json
      ..validateStatus = (int? status) {
        return status != null && status >= 200 && status < 300;
      };

    return client;
  }
}
