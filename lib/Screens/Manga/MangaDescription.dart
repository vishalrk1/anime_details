import 'package:anime_search/Screens/Anime/DetailScreen%20Widgets/RichText.dart';
import 'package:anime_search/provider/data_provider.dart';
import 'package:anime_search/values/constants.dart';
import 'package:flutter/material.dart';

class MangaDescription extends StatelessWidget {
  const MangaDescription({
    Key? key,
    required this.mangaDetails,
  }) : super(key: key);

  final DataProvider mangaDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              RichDetailText(
                title: "Type",
                bodyText: mangaDetails.mangaData.type,
              ),
              SizedBox(
                width: 20,
              ),
              RichDetailText(
                title: "Chapters",
                bodyText: mangaDetails.mangaData.chapters == 0
                    ? "Not Available"
                    : mangaDetails.mangaData.chapters.toString(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RichDetailText(
            title: "Volumes",
            bodyText: mangaDetails.mangaData.volumes == 0
                ? "Not Available"
                : mangaDetails.mangaData.volumes.toString(),
          ),
          Divider(
            color: bodyTextColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: RichDetailText(
              title: "Description",
              bodyText: mangaDetails.mangaData.synopsis,
            ),
          ),
        ],
      ),
    );
  }
}
