import 'package:flutter/material.dart';

class FoodModel {
  final String title;
  final String ingredient;
  final String image;
  final int price;
  final String calories;
  final String description;

  const FoodModel({
    Key key,
    this.title = "Title",
    this.ingredient = "Ingredient",
    this.image = "assets/images/salad_1.png",
    this.price = 0,
    this.calories = "Calories",
    this.description = "Description",
  });
}