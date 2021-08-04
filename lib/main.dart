import 'package:anime_search/Screens/Anime/Anime_details_screen.dart';
import 'package:anime_search/Screens/Homepage.dart';
import 'package:anime_search/Screens/Manga/Manga_Details_screen.dart';
import 'package:anime_search/Screens/Manga/Manga_Page.dart';
import 'package:anime_search/Screens/News/News_Screen.dart';
import 'package:anime_search/Screens/Schedule_Screen.dart/Schedule_page.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/Constants.dart';
import 'package:anime_search/widgets/WebView_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DataProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Animezz',
        theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          canvasColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
              .copyWith(
                bodyText1: TextStyle(color: bodyTextColor),
                bodyText2: TextStyle(color: bodyTextColor),
              ),
        ),
        home: HomePageScreen(),
        routes: {
          HomePageScreen.routName: (ctx) => HomePageScreen(),
          AnimeDetailScreen.routName: (ctx) => AnimeDetailScreen(),
          MangaScreen.routName: (ctx) => MangaScreen(),
          MangaDetailScreen.routName: (ctx) => MangaDetailScreen(),
          ScheduleScreen.routName: (ctx) => ScheduleScreen(),
          NewsScreen.rotName: (ctx) => NewsScreen(),
          WebViewScreen.routName: (ctx) => WebViewScreen(),
        },
      ),
    );
  }
}
