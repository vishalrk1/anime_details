import 'package:anime_search/Screens/Anime/DetailScreen%20Widgets/RichText.dart';
import 'package:anime_search/models/manga_model.dart';
import 'package:anime_search/values/Constants.dart';
import 'package:flutter/material.dart';

class MangaDataColumn extends StatelessWidget {
  const MangaDataColumn({Key? key, required this.mangaDetails})
      : super(key: key);

  final MangaModel mangaDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          mangaDetails.title,
          style: TextStyle(
              color: yelloColor, fontSize: 19, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(
          height: 10,
        ),
        RichDetailText(
          title: "Start Date",
          bodyText: mangaDetails.startDate,
        ),
        SizedBox(
          height: 5,
        ),
        RichDetailText(
          title: "End Date",
          bodyText: mangaDetails.endDate,
        ),
        SizedBox(
          height: 5,
        ),
        RichDetailText(
          title: "Status",
          bodyText: mangaDetails.status,
        ),
        SizedBox(
          height: 30,
        ),
        RichDetailText(
          title: "Rank",
          bodyText: mangaDetails.rank.toString(),
        ),
        SizedBox(
          height: 5,
        ),
        RichDetailText(
          title: "Rating",
          bodyText: mangaDetails.score.toString(),
        ),
      ],
    );
  }
}
