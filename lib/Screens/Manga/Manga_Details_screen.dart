import 'package:anime_search/Screens/Error_page.dart';
import 'package:anime_search/Screens/Homepage.dart';
import 'package:anime_search/Screens/Manga/Manga_Page.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/constants.dart';
import 'package:anime_search/widgets/Recommendation_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:anime_search/Screens/Anime/DetailScreen%20Widgets/AnimeDescription.dart';

import 'MangaDescription.dart';
import 'MangaDetails Screen Widgets/Manga_ImageRow.dart';

class MangaDetailScreen extends StatefulWidget {
  static const routName = '/manga-details';
  MangaDetailScreen({Key? key}) : super(key: key);

  @override
  _MangaDetailScreenState createState() => _MangaDetailScreenState();
}

class _MangaDetailScreenState extends State<MangaDetailScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      late int mangaId = ModalRoute.of(context)!.settings.arguments as int;
      print(mangaId);
      Provider.of<DataProvider>(context, listen: false)
          .getSelectedMangaData(mangaId);
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenWidth = device.size.width;
    final mangaDetails = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: mangaDetails.isLoading
          ? AppBar(
              backgroundColor: darkColor,
              title: Text(
                "Animezz",
                style: Theme.of(context).textTheme.headline6,
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(MangaScreen.routName);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
            )
          : null,
      body: mangaDetails.isError
          ? ErrorPage()
          : mangaDetails.isLoading
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
                          Navigator.of(context)
                              .pushReplacementNamed(MangaScreen.routName);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          MangaImageRow(
                            mangaDetails: mangaDetails,
                          ),

                          MangaDescription(mangaDetails: mangaDetails),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 15,
                          //   ),
                          //   child: Text(
                          //     "Similar Anime:",
                          //     style: TextStyle(
                          //         color: greenTextColor,
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          // ),
                          // Container(
                          //   width: screenWidth,
                          //   height: screenWidth / 2,
                          //   margin: EdgeInsets.symmetric(vertical: 10),
                          //   child: ListView.builder(
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: mangaDetails.recomendationList.length,
                          //     itemBuilder: (ctx, index) => RecommendationCard(
                          //       recommendatedAnime:
                          //           mangaDetails.recomendationList[index],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
