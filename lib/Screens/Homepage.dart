import 'package:anime_search/Screens/Anime/Anime_grid.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/Constants.dart';
import 'package:anime_search/widgets/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  static const routName = '/home-page';
  HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  Future<void> getData(String category) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getHomeData(category: category);
  }

  void getSearchData(String query) {
    Provider.of<DataProvider>(context, listen: false).getSearchData(query);
  }

  Widget categoryBtn(String name, int index, String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          getData(category);
        });
      },
      child: FittedBox(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2.5),
          decoration: BoxDecoration(
            color: index == _selectedIndex ? darkColor : yelloColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.orange,
              width: .8,
            ),
          ),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: index == _selectedIndex ? yelloColor : darkColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: FloatingSearchAppBar(
        color: darkColor,
        liftOnScrollElevation: 0,
        elevation: 0,
        colorOnScroll: secondaryColor,
        autocorrect: false,
        hint: "Entre anime or manga",
        iconColor: yelloColor,
        title: Text(
          'Animezz',
          style: Theme.of(context).textTheme.headline6,
        ),
        onFocusChanged: (isFocused) {
          if (!isFocused) {
            setState(() {
              getData('airing');
            });
          }
        },
        onSubmitted: (query) {
          setState(() {
            _selectedIndex = 0;
            getSearchData(query);
          });
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 30,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                children: [
                  categoryBtn('Top', 0, 'airing'),
                  categoryBtn("Popular", 1, 'bypopularity'),
                  categoryBtn("UpComing", 2, 'upcoming'),
                  categoryBtn("Series", 3, 'tv'),
                  categoryBtn("Movies", 4, 'movie'),
                  categoryBtn("OVA", 5, 'ova'),
                  categoryBtn("Special", 6, 'special'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: AnimeGrid(
                  screen: home_Anime,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
