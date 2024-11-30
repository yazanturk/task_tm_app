import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/feature/weather_feature/presentation/pages/details_home_Screen.dart';
import 'package:task_tm_app/feature/weather_feature/presentation/provider/home_provider.dart';

class BuildWeatherWidget extends StatelessWidget {
  const BuildWeatherWidget({super.key, required this.data, required this.index});

  final WeatherDataHiveModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsHomeScreen(dataHiveModel: data),
          )),
      title: Text(data.cityName),
      subtitle: Row(
        children: [
          Text(data.temperature),
          Text(' - '),
          Text(data.weatherCondition),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          Provider.of<HomeProvider>(context, listen: false).deleteWeather(index);
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
