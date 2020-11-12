import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/ThemeTutorial4.dart';

AppBar buildAppBar(BuildContext context,
    {bool isTransparent = false, String title}) {
  return AppBar(
    backgroundColor: isTransparent ? Colors.transparent : Colors.white,
    elevation: 0,
    leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: ThemeTutorial4.kIconColor,
        ),
        onPressed: () {}),
    title: !isTransparent
        ? Text(
            isTransparent ? "" : title,
            style: TextStyle(color: ThemeTutorial4.kTextColor),
          )
        : null,
    centerTitle: true,
    actions: [
      IconButton(
          icon: ClipOval(
              child: Image.asset("assets/images/tutorial4/profile.png")),
          onPressed: () {})
    ],
  );
}
