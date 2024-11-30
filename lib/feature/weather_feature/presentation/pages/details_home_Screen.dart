import 'package:flutter/material.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';

class DetailsHomeScreen extends StatelessWidget {
  const DetailsHomeScreen({super.key, required this.dataHiveModel});
  final WeatherDataHiveModel dataHiveModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Weather Details'),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dataHiveModel.cityName),
                      Text(dataHiveModel.temperature),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('humidity'),
                      Text('Speed Wind'),
                      Text('Weather Condition'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dataHiveModel.humidity),
                      Text(dataHiveModel.windSpeed),
                      Text(dataHiveModel.weatherCondition),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
