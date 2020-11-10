import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial3_covid_ui/screen/InfoCovidScreen.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/CaseCovidInformation.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/HeaderHomeCovid.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/MapInformation.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/TextFieldSelectCountry.dart';

class HomeCovidScreen extends StatefulWidget {
  @override
  _HomeCovidScreenState createState() => _HomeCovidScreenState();
}

class _HomeCovidScreenState extends State<HomeCovidScreen> {
  double offset = 0;
  final ScrollController scrollController = ScrollController();
  final Function _onPressMenuHome = (context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return InfoCovidScreen();
        },
      ),
    );
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (scrollController.hasClients) ? scrollController.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        child: Column(
          children: <Widget>[
            HeaderHomeCovid(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
              onPressMenu: () {
                _onPressMenuHome(context);
              },
            ),
            TextFieldSelectCountry(),
            CaseCovidInformation(),
            MapInformation(),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
