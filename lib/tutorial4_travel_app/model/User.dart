import 'package:flutter/material.dart';

class User {
  final String name, avatar;

  User({@required this.name, @required this.avatar});
}

// Demo List of Top Travelers
List<User> topTravelers = [user1, user2, user3, user4];

// demo user
User user1 = User(name: "James", avatar: "assets/images/tutorial4/james.png");
User user2 = User(name: "John", avatar: "assets/images/tutorial4/John.png");
User user3 = User(name: "Marry", avatar: "assets/images/tutorial4/marry.png");
User user4 = User(name: "Rosy", avatar: "assets/images/tutorial4/rosy.png");