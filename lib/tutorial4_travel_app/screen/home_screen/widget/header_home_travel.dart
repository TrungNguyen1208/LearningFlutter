import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/home_screen/widget/search_field_travel.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';

class HeaderHomeTravel extends StatelessWidget {
  const HeaderHomeTravel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(25)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/tutorial4/home_bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: getProportionateScreenHeight(315),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(80)),
              Text(
                "Travelers",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(73),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 0.5,
                ),
              ),
              Text(
                "Travel Community App",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Positioned(
            bottom: getProportionateScreenWidth(-25),
            child: SearchFieldTravel(),
          )
        ],
      ),
    );
  }
}
