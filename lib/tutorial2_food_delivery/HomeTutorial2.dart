import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_flutter/tutorial2_food_delivery/DetailsTutorial2.dart';
import 'package:learning_flutter/tutorial2_food_delivery/ThemeTutorial2.dart';
import 'package:learning_flutter/tutorial2_food_delivery/model/FoodModel.dart';
import 'package:learning_flutter/tutorial2_food_delivery/widget/CategoryTitle.dart';
import 'package:learning_flutter/tutorial2_food_delivery/widget/FoodCard.dart';

class HomeTutorial2 extends StatelessWidget {

  static List<FoodModel> listFoodModel = <FoodModel>[
    FoodModel(
        title: "Vegan salad bowl",
        image: "assets/images/salad_1.png",
        price: 20,
        calories: "420Kcal",
        description:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. "),
    FoodModel(
      title: "Vegan salad bowl",
      image: "assets/images/salad_2.png",
      price: 20,
      calories: "420Kcal",
      description:
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeTutorial2.kPrimaryColor.withOpacity(0.26),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ThemeTutorial2.kPrimaryColor,
          ),
          child: SvgPicture.asset("assets/icons/plus.svg"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 50),
            child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  height: 11,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Simple way to find \nTasty food",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                CategoryTitle(
                  title: "All",
                  isActive: true,
                ),
                CategoryTitle(title: "Italian"),
                CategoryTitle(title: "Asian"),
                CategoryTitle(title: "Chinese"),
                CategoryTitle(title: "Burgers"),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ThemeTutorial2.kBorderColor),
            ),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
              fit: BoxFit.contain,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                FoodCard(feedModel: listFoodModel[0], onPress: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailsTutorial2();
                    }),
                  );
                }),
                FoodCard(feedModel: listFoodModel[1], onPress: (){}),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
