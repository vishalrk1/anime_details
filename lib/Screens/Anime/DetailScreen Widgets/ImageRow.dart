import 'package:anime_search/provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'DataColumn.dart';

class ImageRow extends StatelessWidget {
  const ImageRow({
    Key? key,
    required this.animeDetails,
  }) : super(key: key);

  final DataProvider animeDetails;

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
                animeDetails.animeData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AnimeDataColumn(
                animeDetails: animeDetails.animeData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
