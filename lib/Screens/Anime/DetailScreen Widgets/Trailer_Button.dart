import 'package:anime_search/Helper/Url_Launcher.dart';
import 'package:anime_search/values/constants.dart';
import 'package:flutter/material.dart';

class TrailerBtn extends StatelessWidget {
  const TrailerBtn({
    Key? key,
    required this.trailerLink,
  }) : super(key: key);

  final String trailerLink;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        UrlLauncher().launchInBrowser(trailerLink);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        backgroundColor: yelloColor,
      ),
      child: Text(
        "Watch Trailer",
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}
