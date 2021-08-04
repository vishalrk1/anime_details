import 'package:anime_search/Screens/Error_page.dart';
import 'package:anime_search/Screens/Homepage.dart';
import 'package:anime_search/Screens/Schedule_Screen.dart/Schedule_page.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/constants.dart';
import 'package:anime_search/widgets/Recommendation_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DetailScreen Widgets/AnimeDescription.dart';
import 'DetailScreen Widgets/ImageRow.dart';
import 'DetailScreen Widgets/TrailerRow.dart';

class AnimeDetailScreen extends StatefulWidget {
  static const routName = '/anime-details';

  AnimeDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      late final _args = ModalRoute.of(context)!.settings.arguments as Map;
      Provider.of<DataProvider>(context, listen: false)
          .getAnimeData(_args['malId']);
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenWidth = device.size.width;
    final animeDetails = Provider.of<DataProvider>(context);
    final _args = ModalRoute.of(context)!.settings.arguments as Map;
    final String screen = _args['screen'];
    print(screen);
    return Scaffold(
      appBar: animeDetails.isLoading
          ? AppBar(
              backgroundColor: darkColor,
              title: Text(
                "Animezz",
                style: Theme.of(context).textTheme.headline6,
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
            )
          : null,
      body: animeDetails.isError
          ? ErrorPage()
          : animeDetails.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: yelloColor,
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: darkColor,
                      centerTitle: true,
                      title: Text(
                        "Animezz",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      leading: IconButton(
                        onPressed: () {
                          screen == home_Anime
                              ? Navigator.of(context)
                                  .pushReplacementNamed(HomePageScreen.routName)
                              : screen == schedule_Anime
                                  ? Navigator.of(context).pushReplacementNamed(
                                      ScheduleScreen.routName)
                                  : Navigator.of(context).pushReplacementNamed(
                                      HomePageScreen.routName);
                          // Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ImageRow(animeDetails: animeDetails),
                          TrailerRow(animeDetails: animeDetails),
                          Description(animeDetails: animeDetails),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Text(
                              "Similar Anime:",
                              style: TextStyle(
                                  color: greenTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            width: screenWidth,
                            height: screenWidth / 2,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: animeDetails.recomendationList.length,
                              itemBuilder: (ctx, index) => RecommendationCard(
                                recommendatedAnime:
                                    animeDetails.recomendationList[index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
