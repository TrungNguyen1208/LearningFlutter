import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/ThemeTutorial4.dart';

class AddNewPlaceCard extends StatelessWidget {

  const AddNewPlaceCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: getProportionateScreenWidth(350),
      width: getProportionateScreenWidth(158),
      decoration: BoxDecoration(
        color: Color(0xFF6A6C93).withOpacity(0.09),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Color(0xFFEBE8F6),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: getProportionateScreenWidth(53),
            width: getProportionateScreenWidth(53),
            child: FlatButton(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: ThemeTutorial4.kPrimaryColor,
              onPressed: () {},
              child: Icon(
                Icons.add,
                size: getProportionateScreenWidth(35),
                color: Colors.white,
              ),
            ),
          ),
          VerticalSpacing(of: 10),
          Text(
            "Add New Place",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
