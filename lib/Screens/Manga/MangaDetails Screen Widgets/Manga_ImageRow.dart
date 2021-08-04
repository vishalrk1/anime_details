import 'package:anime_search/provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'Manga_DataColumn.dart';

class MangaImageRow extends StatelessWidget {
  const MangaImageRow({
    Key? key,
    required this.mangaDetails,
  }) : super(key: key);

  final DataProvider mangaDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                mangaDetails.mangaData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: MangaDataColumn(
                mangaDetails: mangaDetails.mangaData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
