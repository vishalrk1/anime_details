import 'package:anime_search/Screens/Error_page.dart';
import 'package:anime_search/models/news_model.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/constants.dart';
import 'package:anime_search/widgets/AppDrawer.dart';
import 'package:anime_search/widgets/News_card.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  static const rotName = '/news-screen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      getData();
    }
    _isInit = false;
  }

  Future<void> getData() async {
    await Provider.of<DataProvider>(context, listen: false).getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<DataProvider>(context);
    final List<NewsModel> newsList =
        Provider.of<DataProvider>(context).newsList;
    print(newsList.length);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: darkColor,
        title: Text("Animezz", style: Theme.of(context).textTheme.headline6),
        iconTheme: IconThemeData(
          color: yelloColor,
        ),
      ),
      body: providerData.isError
          ? ErrorPage()
          : providerData.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: yelloColor,
                  ),
                )
              : LiveList.options(
                  itemCount: newsList.length,
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
                    child: NewsCard(news: newsList[index]),
                  ),
                ),
    );
  }
}
