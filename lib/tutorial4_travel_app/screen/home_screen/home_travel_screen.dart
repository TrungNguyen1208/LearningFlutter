import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/components/app_bar_travel.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/components/bottom_bar_travel.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/home_screen/widget/header_home_travel.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/home_screen/widget/popular_places.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/home_screen/widget/top_travelers.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';

class HomeTravelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context, isTransparent: true),
      body: BodyHomeTravelScreen(),
      bottomNavigationBar: BottomBarTravel(),
    );
  }
}

class BodyHomeTravelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            HeaderHomeTravel(),
            VerticalSpacing(),
            PopularPlaces(),
            VerticalSpacing(),
            TopTravelers()
          ],
        ),
      ),
    );
  }
}
