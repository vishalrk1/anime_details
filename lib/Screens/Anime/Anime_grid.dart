import 'package:anime_search/Screens/Error_page.dart';
import 'package:anime_search/models/HomePage_model.dart';
import 'package:anime_search/models/shedule_anime_model.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/Constants.dart';
import 'package:anime_search/widgets/Anime_Home_Card.dart';
import 'package:anime_search/widgets/Anime_Schedule_Card.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeGrid extends StatefulWidget {
  AnimeGrid({Key? key, required this.screen}) : super(key: key);
  final String screen;

  @override
  _AnimeGridState createState() => _AnimeGridState();
}

class _AnimeGridState extends State<AnimeGrid> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    widget.screen == schedule_Anime
        ? await Provider.of<DataProvider>(context, listen: false)
            .getScheduleData()
        : await Provider.of<DataProvider>(context, listen: false).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenHeight = device.size.height;
    final screenWidth = device.size.width;

    final dataProvider = Provider.of<DataProvider>(context);
    final List<HomeCardModel> homeAnimeList =
        Provider.of<DataProvider>(context).searchList;
    final List<ScheduleAnime> scheduleAnimeList =
        Provider.of<DataProvider>(context).scheduleList;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: dataProvider.isError
            ? ErrorPage()
            : dataProvider.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: yelloColor,
                      strokeWidth: 5,
                    ),
                  )
                : LiveGrid.options(
                    padding: EdgeInsets.all(15),
                    itemCount: widget.screen == schedule_Anime
                        ? scheduleAnimeList.length
                        : homeAnimeList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5 / 2.5,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    options: LiveOptions(
                      showItemInterval: Duration(
                        milliseconds: 100,
                      ),
                    ),
                    itemBuilder: (ctx, index, animation) => FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(animation),
                      child: widget.screen == schedule_Anime
                          ? AnimeScheduleCard(
                              homeCard: scheduleAnimeList[index])
                          : AnimeHomeCard(homeCard: homeAnimeList[index]),
                    ),
                  ),
      ),
    );
  }
}
