import 'package:flutter/material.dart';
import 'package:flutter_provider_utilities/flutter_provider_utilities.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_tm_app/config/helper/hive_helper/entity/weather_model.dart';
import 'package:task_tm_app/feature/search_feature/presentation/provider/search_provider.dart';
import 'package:task_tm_app/feature/weather_feature/presentation/pages/details_home_Screen.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var watchProvider = context.watch<SearchProvider>();
    return MessageListener<SearchProvider>(
      showInfo: (info) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
      },
      showError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
      },
      child: ValueListenableBuilder<Box<WeatherModel>>(
          valueListenable: Hive.box<WeatherModel>('weather').listenable(),
          builder: (context, box, child) {
            WeatherModel? weatherModelLocally = box.get(0);
            if (watchProvider.searchStatus == SearchStatus.init) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 150,
                  ),
                  Text('Start searching...'),
                ],
              );
            }
            if (watchProvider.searchStatus == SearchStatus.error) {
              return Center(child: Text(context.watch<SearchProvider>().errorMessage));
            }

            return Skeletonizer(
                enabled: watchProvider.searchStatus == SearchStatus.loading,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsHomeScreen(dataHiveModel: watchProvider.searchWeatherEntity.toSaveLocal()),
                          )),
                      title: Text(watchProvider.searchWeatherEntity.cityName ?? ''),
                      subtitle: Text(watchProvider.searchWeatherEntity.temperature?.toString() ?? ''),
                      trailing: TextButton(
                          onPressed: () {
                            if ((weatherModelLocally?.weathers?.any((element) =>
                                    element.id.toString() == watchProvider.searchWeatherEntity.id.toString()) ??
                                false)) {
                              watchProvider.removeItem(watchProvider.searchWeatherEntity.id ?? 0);
                            } else {
                              watchProvider.saveSearch(watchProvider.searchWeatherEntity.toSaveLocal());
                            }
                          },
                          child: (weatherModelLocally?.weathers?.any((element) =>
                                      element.id.toString() == watchProvider.searchWeatherEntity.id.toString()) ??
                                  false)
                              ? Text('Remove')
                              : Text('Save')),
                    ),
                  ),
                  itemCount: 1,
                ));
          }),
    );
  }
}
