import 'package:anime_search/Screens/Anime/Anime_grid.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/Constants.dart';

import 'package:anime_search/widgets/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  static const routName = '/schedule-screen';
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedIndex = 0;

  Future<void> getSchedualeData(String selectedDay) async {
    await Provider.of<DataProvider>(context, listen: false)
        .getScheduleData(day: selectedDay);
  }

  void getSearchData(String query) {
    Provider.of<DataProvider>(context, listen: false).getSearchData(query);
  }

  Widget categoryBtn(String name, int index, String selectedDay) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          getSchedualeData(selectedDay);
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
              getSchedualeData('sunday');
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
                  categoryBtn('Sunday', 0, 'sunday'),
                  categoryBtn('Monday', 1, 'monday'),
                  categoryBtn("Tuesday", 2, 'tuesday'),
                  categoryBtn("Wednesday", 3, 'wednesday'),
                  categoryBtn("Thursday", 4, 'thursday'),
                  categoryBtn("Friday", 5, 'friday'),
                  categoryBtn("Saturday", 6, 'saturday')
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: AnimeGrid(
                  screen: schedule_Anime,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
