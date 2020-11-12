import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial4_travel_app/model/TravelSpot.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/components/section_title.dart';
import 'package:learning_flutter/tutorial4_travel_app/screen/home_screen/widget/place_card.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/SizeConfig.dart';
import 'package:learning_flutter/tutorial4_travel_app/util/ThemeTutorial4.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Right Now At Spark",
          press: () {},
        ),
        VerticalSpacing(of: 20),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                travelSpots.length,
                (index) => _buildPlaceCard(index),
              ),
              SizedBox(
                width:
                    getProportionateScreenWidth(ThemeTutorial4.kDefaultPadding),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget _buildPlaceCard(int index) {
  return Padding(
    padding: EdgeInsets.only(
      left: getProportionateScreenWidth(ThemeTutorial4.kDefaultPadding),
    ),
    child: PlaceCard(travelSport: travelSpots[index], press: (){},),
  );
}
