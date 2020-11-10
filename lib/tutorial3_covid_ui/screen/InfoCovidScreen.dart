import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/CovidPreventionView.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/CovidSymptomsView.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/HeaderHomeCovid.dart';

class InfoCovidScreen extends StatefulWidget {
  @override
  _InfoCovidScreenState createState() => _InfoCovidScreenState();
}

class _InfoCovidScreenState extends State<InfoCovidScreen> {
  final scrollController = ScrollController();
  double offset = 0;

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
              image: "assets/icons/Drcorona2.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19.",
              offset: offset,
              onPressMenu: (){},
              isShowBack: true,
            ),
            CovidSymptomsView(),
            CovidPreventionView(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
