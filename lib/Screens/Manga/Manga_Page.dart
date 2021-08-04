import 'package:anime_search/Screens/Manga/Manga_grid.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/constants.dart';
import 'package:anime_search/widgets/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class MangaScreen extends StatefulWidget {
  static const routName = '/manga-screen';
  const MangaScreen({Key? key}) : super(key: key);

  @override
  _MangaScreenState createState() => _MangaScreenState();
}

class _MangaScreenState extends State<MangaScreen> {
  int _selectedIndex = 0;

  Future<void> getMangaData(String mangaCategory) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getMangaData(category: mangaCategory);
  }

  void getSearchData(String query) {
    Provider.of<DataProvider>(context, listen: false).getMangaSearchData(query);
  }

  Widget categoryBtn(String name, int index, String mangaCategory) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          print(_selectedIndex);
          getMangaData(mangaCategory);
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
        hint: "Entre manga name",
        iconColor: yelloColor,
        title: Text(
          'Animezz',
          style: Theme.of(context).textTheme.headline6,
        ),
        onFocusChanged: (isFocused) {
          if (!isFocused) {
            setState(() {
              getMangaData('manga');
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
                  categoryBtn('Manga', 0, 'manga'),
                  categoryBtn("Manhwa", 1, 'manhwa'),
                  categoryBtn("Popular", 2, 'bypopularity'),
                  categoryBtn("Doujin", 3, 'doujin'),
                  categoryBtn("Manhua", 4, 'manhua'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: MangaGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
