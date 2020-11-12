import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/events_screen/events_screen.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/ThemeTutorial4.dart';

class BottomBarTravel extends StatelessWidget {
  const BottomBarTravel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: "assets/icons/calendar.svg",
                title: "Events",
                isActive: true,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventsScreen(),
                    ),
                  );
                },
              ),
              NavItem(
                icon: "assets/icons/chat.svg",
                title: "Chat",
                isActive: true,
                press: () {},
              ),
              NavItem(
                icon: "assets/icons/friendship.svg",
                title: "Friends",
                isActive: true,
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String icon, title;
  final GestureTapCallback press;
  final bool isActive;

  const NavItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5),
        height: getProportionateScreenWidth(60),
        width: getProportionateScreenWidth(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isActive) ThemeTutorial4.kDefaultShadow],
        ),
        child: Column(children: [
          SvgPicture.asset(
            icon,
            color: ThemeTutorial4.kTextColor,
            height: 28,
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      ),
    );
  }
}
