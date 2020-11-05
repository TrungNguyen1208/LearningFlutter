import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial2_food_delivery/ThemeTutorial2.dart';
import 'package:learning_flutter/tutorial2_food_delivery/model/FoodModel.dart';

class FoodCard extends StatelessWidget {
  final FoodModel feedModel;
  final Function onPress;

  FoodCard({
    this.feedModel = const FoodModel(),
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        width: 270,
        height: 400,
        child: Stack(
          children: <Widget>[
            // Big light background
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 380,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34),
                    color: ThemeTutorial2.kPrimaryColor.withOpacity(.06),
                  ),
                )),
            // Rounded background
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 181,
                width: 181,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeTutorial2.kPrimaryColor.withOpacity(.15),
                ),
              ),
            ),
            // Food Image
            Positioned(
              top: 0,
              left: -50,
              child: Container(
                height: 184,
                width: 276,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("${feedModel.image}")),
                ),
              ),
            ),
            // Price
            Positioned(
              right: 20,
              top: 80,
              child: Text(
                "\$${feedModel.price}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: ThemeTutorial2.kPrimaryColor),
              ),
            ),
            // Information
            Positioned(
              top: 201,
              left: 40,
              child: Container(
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${feedModel.title}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text("With ${feedModel.ingredient}",
                        style: TextStyle(
                          color: ThemeTutorial2.kTextColor.withOpacity(0.4),
                        )),
                    SizedBox(height: 16),
                    Text(
                      "${feedModel.description}",
                      maxLines: 3,
                      style: TextStyle(
                        color: ThemeTutorial2.kTextColor.withOpacity(.65),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("${feedModel.calories}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
