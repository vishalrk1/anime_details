import 'package:anime_search/Screens/Homepage.dart';
import 'package:anime_search/Screens/Manga/Manga_Page.dart';
import 'package:anime_search/Screens/News/News_Screen.dart';
import 'package:anime_search/Screens/Schedule_Screen.dart/Schedule_page.dart';
import 'package:anime_search/values/constants.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  // final int selectedIndex;
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: darkColor,
              ),
              child: Center(
                child: Text(
                  "Animezz",
                  style: Theme.of(context).textTheme.headline6,
                ),
              )),
          SizedBox(
            height: 2,
          ),
// home Button............................................
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(HomePageScreen.routName);
            },
            child: Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.home_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: yelloColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
//week sheduale button......................................
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MangaScreen.routName);
            },
            child: Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.book_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Top Manga",
                      style: TextStyle(
                        color: yelloColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
//week sheduale button......................................
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ScheduleScreen.routName);
            },
            child: Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Schedule",
                      style: TextStyle(
                        color: yelloColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
//Top News button......................................
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(NewsScreen.rotName);
            },
            child: Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.tv_outlined),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Top News",
                      style: TextStyle(
                        color: yelloColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    ));
  }
}
