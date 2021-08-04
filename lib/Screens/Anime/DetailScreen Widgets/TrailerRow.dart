import 'package:anime_search/provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'RichText.dart';
import 'Trailer_Button.dart';

class TrailerRow extends StatelessWidget {
  const TrailerRow({
    Key? key,
    required this.animeDetails,
  }) : super(key: key);

  final DataProvider animeDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichDetailText(
              title: "Duration", bodyText: animeDetails.animeData.duration),
          TrailerBtn(
            trailerLink: animeDetails.animeData.trailerUrl,
          ),
        ],
      ),
    );
  }
}
