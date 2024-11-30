import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tm_app/feature/search_feature/presentation/pages/widgets/custom_search_app.dart';
import 'package:task_tm_app/feature/search_feature/presentation/pages/widgets/weather_widget.dart';
import 'package:task_tm_app/feature/search_feature/presentation/provider/search_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController search;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    search = SearchController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: BackButton(
              onPressed: () => Navigator.pop(context, true),
            ),
            title: Text('Search Weather'),
            bottom: PreferredSize(
                preferredSize: Size(MediaQuery.sizeOf(context).width, kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomSearchApp(
                          search: search,
                          onPress: () {},
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Provider.of<SearchProvider>(context, listen: false).searchWeather(search.text);
                          },
                          child: Text('search'))
                    ],
                  ),
                )),
          ),
          //
          SliverFillRemaining(
            hasScrollBody: true,
            child: WeatherWidget(),
          ),
        ],
      ),
    );
  }
}
