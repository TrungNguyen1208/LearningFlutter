import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/model/User.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/components/section_title.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/ThemeTutorial4.dart';

class TopTravelers extends StatelessWidget {
  const TopTravelers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Top Travelers on Spark", press: () {}),
        VerticalSpacing(
          of: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal:
                getProportionateScreenWidth(ThemeTutorial4.kDefaultPadding),
          ),
          padding: EdgeInsets.all(getProportionateScreenWidth(24)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [ThemeTutorial4.kDefaultShadow],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                topTravelers.length,
                (index) {
                  return UserCard(user: topTravelers[index], press: () {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key key,
    @required this.user,
    @required this.press,
  }) : super(key: key);

  final User user;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double sizeAvatar = getProportionateScreenWidth(55);

    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              user.avatar,
              width: sizeAvatar,
              height: sizeAvatar,
              fit: BoxFit.cover,
            ),
          ),
          VerticalSpacing(of: 10),
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
          )
        ],
      ),
    );
  }
}
