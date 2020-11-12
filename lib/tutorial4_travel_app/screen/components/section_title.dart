import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/ThemeTutorial4.dart';

class SectionTitle extends StatelessWidget {

  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(ThemeTutorial4.kDefaultPadding),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: press,
            child: Text("See All"),
          ),
        ],
      ),
    );
  }
  
}