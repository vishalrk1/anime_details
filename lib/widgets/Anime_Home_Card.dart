import 'package:anime_search/Screens/Anime/Anime_details_screen.dart';
import 'package:anime_search/models/HomePage_model.dart';
import 'package:anime_search/values/constants.dart';
import 'package:flutter/material.dart';

class AnimeHomeCard extends StatelessWidget {
  final HomeCardModel homeCard;
  const AnimeHomeCard({Key? key, required this.homeCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AnimeDetailScreen.routName,
            arguments: {'malId': homeCard.malId, 'screen': home_Anime});
      },
      child: Container(
        height: 150,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: homeCard.malId,
                  child: Image.network(
                    homeCard.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      homeCard.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: yelloColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: homeCard.score >= 8
                          ? greenTextColor
                          : homeCard.score >= 5
                              ? yelloColor
                              : Colors.red[400],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
