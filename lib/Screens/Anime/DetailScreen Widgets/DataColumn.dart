import 'package:anime_search/models/anime_model.dart';
import 'package:anime_search/values/Constants.dart';
import 'package:flutter/material.dart';

import 'RichText.dart';

class AnimeDataColumn extends StatelessWidget {
  const AnimeDataColumn({Key? key, required this.animeDetails})
      : super(key: key);

  final AnimeModel animeDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          animeDetails.titleEnglish,
          style: TextStyle(
              color: yelloColor, fontSize: 19, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(
          height: 15,
        ),
        RichDetailText(
          title: "Release",
          bodyText: animeDetails.airingDate,
        ),
        SizedBox(
          height: 5,
        ),
        RichDetailText(
          title: "Status",
          bodyText: animeDetails.status,
        ),
        SizedBox(
          height: 5,
        ),
        RichDetailText(
          title: "Episodes",
          bodyText: animeDetails.episodes.toString(),
        ),
        SizedBox(
          height: 30,
        ),
        RichDetailText(
          title: "Rank",
          bodyText: animeDetails.rank.toString(),
        ),
        SizedBox(
          height: 5,
        ),
        RichDetailText(
          title: "Rating",
          bodyText: animeDetails.rating,
        ),
      ],
    );
  }
}
