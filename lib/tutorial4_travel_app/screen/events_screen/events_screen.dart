import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/model/TravelSpot.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/components/app_bar_travel.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/components/bottom_bar_travel.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/events_screen/add_new_place_card.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/home_screen/widget/place_card.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, isTransparent: true),
      body: BodyEventsScreen(),
      bottomNavigationBar: BottomBarTravel(),
    );
  }
}

class BodyEventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 25,
              children: [
                ...List.generate(travelSpots.length, (index) {
                  return PlaceCard(
                    travelSport: travelSpots[index],
                    isFullCard: true,
                    press: () {},
                  );
                }),
                AddNewPlaceCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
