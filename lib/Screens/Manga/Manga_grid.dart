import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/constants.dart';
import 'package:anime_search/widgets/Anime_Home_Card.dart';
import 'package:anime_search/widgets/Manga_Home_Card.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MangaGrid extends StatefulWidget {
  MangaGrid({Key? key}) : super(key: key);

  @override
  _MangaGridState createState() => _MangaGridState();
}

class _MangaGridState extends State<MangaGrid> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    await Provider.of<DataProvider>(context, listen: false).getMangaData();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context);
    final screenHeight = device.size.height;
    final screenWidth = device.size.width;

    final mangaData = Provider.of<DataProvider>(context);

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: mangaData.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: yelloColor,
                  strokeWidth: 5,
                ),
              )
            : LiveGrid.options(
                padding: EdgeInsets.all(15),
                itemCount: mangaData.mangaList.length,
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
                  child: MangHomeCard(homeCard: mangaData.mangaList[index]),
                ),
              ),
      ),
    );
  }
}
