import 'package:anime_search/values/Constants.dart';
import 'package:flutter/material.dart';

class RichDetailText extends StatelessWidget {
  const RichDetailText({
    Key? key,
    required this.title,
    required this.bodyText,
  }) : super(key: key);

  final String title;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "$title: ",
        style: TextStyle(color: greenTextColor, fontSize: 17),
        children: <TextSpan>[
          TextSpan(
              text: bodyText,
              style: TextStyle(color: bodyTextColor, fontSize: 15))
        ],
      ),
    );
  }
}
