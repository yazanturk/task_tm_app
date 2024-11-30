import 'package:flutter/material.dart';
import 'package:flutter_provider_utilities/flutter_provider_utilities.dart';
import 'package:provider/provider.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/core/service_locator/service_locator.dart' as di;
import 'package:task_tm_app/feature/search_feature/presentation/pages/search_screen.dart';
import 'package:task_tm_app/feature/search_feature/presentation/provider/search_provider.dart';
import 'package:task_tm_app/feature/weather_feature/presentation/provider/home_provider.dart';
import 'package:task_tm_app/feature/weather_feature/presentation/widgets/build_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Journal'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                    create: (context) => SearchProvider(di.getIt(), di.getIt(), di.getIt()), child: SearchPage()),
              ));

          provider.getListOfWeathers();
        },
        child: Icon(Icons.search),
      ),
      body: CustomScrollView(
        slivers: [
          MessageListener<HomeProvider>(
            showError: (error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
            },
            showInfo: (info) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
            },
            child: SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              sliver: context.watch<HomeProvider>().weatherModel.weathers?.isEmpty ?? true
                  ? SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('No Data Found'),
                            TextButton.icon(
                              onPressed: () {
                                Provider.of<HomeProvider>(context, listen: false).getListOfWeathers();
                              },
                              label: Text('Refresh'),
                              icon: Icon(Icons.refresh),
                            )
                          ],
                        ),
                      ),
                    )
                  : SliverList.builder(
                      itemBuilder: (context, index) {
                        WeatherDataHiveModel data = context.watch<HomeProvider>().weatherModel.weathers![index];
                        return BuildWeatherWidget(
                          data: data,
                          index: index,
                        );
                      },
                      itemCount: context.watch<HomeProvider>().weatherModel.weathers?.length,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
