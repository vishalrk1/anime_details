import 'package:anime_search/provider/data_provider.dart';
import 'package:flutter/material.dart';

import 'RichText.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.animeDetails,
  }) : super(key: key);

  final DataProvider animeDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: RichDetailText(
        title: "Description",
        bodyText: animeDetails.animeData.synopsis,
      ),
    );
  }
}
