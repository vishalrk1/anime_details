import 'package:anime_search/Screens/Anime/Anime_details_screen.dart';
import 'package:anime_search/models/Recomendation_data.dart';
import 'package:anime_search/values/constants.dart';
import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final RecomendationModel recommendatedAnime;
  const RecommendationCard({Key? key, required this.recommendatedAnime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AnimeDetailScreen.routName,
                    arguments: {
                      'malId': recommendatedAnime.malId,
                      'screen': "Reccomendation"
                    });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(recommendatedAnime.imageUrl),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            recommendatedAnime.title,
            overflow: TextOverflow.fade,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: yelloColor, fontSize: 15, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
