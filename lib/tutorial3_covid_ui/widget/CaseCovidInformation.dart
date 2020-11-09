import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial3_covid_ui/ThemeTutorial3.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/Counter.dart';

class CaseCovidInformation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Case Update\n",
                          style: ThemeTutorial3.kTitleTextstyle,
                        ),
                        TextSpan(
                          text: "Newest update March 28",
                          style: TextStyle(
                            color: ThemeTutorial3.kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See details",
                    style: TextStyle(
                      color: ThemeTutorial3.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 30,
                color: ThemeTutorial3.kShadowColor,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Counter(
                color: ThemeTutorial3.kInfectedColor,
                number: 1046,
                title: "Infected",
              ),
              Counter(
                color: ThemeTutorial3.kDeathColor,
                number: 87,
                title: "Deaths",
              ),
              Counter(
                color: ThemeTutorial3.kRecovercolor,
                number: 46,
                title: "Recovered",
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Spread of Virus",
                style: ThemeTutorial3.kTitleTextstyle,
              ),
              Text(
                "See details",
                style: TextStyle(
                  color: ThemeTutorial3.kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
