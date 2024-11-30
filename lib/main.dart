import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/service_locator/service_locator.dart' as sl;
import 'package:task_tm_app/feature/weather_feature/presentation/pages/home_screen.dart';
import 'package:task_tm_app/feature/weather_feature/presentation/provider/home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(WeatherModelAdapter());
  Hive.registerAdapter(WeatherDataHiveModelAdapter());
  await Hive.openBox<WeatherModel>('weather');
  await sl.configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
          create: (context) => HomeProvider(
                sl.getIt(),
                sl.getIt(),
              )..getListOfWeathers(),
          lazy: false,
          child: HomeScreen()),
    );
  }
}
