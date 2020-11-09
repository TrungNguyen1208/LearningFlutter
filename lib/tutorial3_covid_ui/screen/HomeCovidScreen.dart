import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/CaseCovidInformation.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/HeaderHomeCovid.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/MapInformation.dart';
import 'package:learning_flutter/tutorial3_covid_ui/widget/TextFieldSelectCountry.dart';

class HomeCovidScreen extends StatefulWidget {
  @override
  _HomeCovidScreenState createState() => _HomeCovidScreenState();
}

class _HomeCovidScreenState extends State<HomeCovidScreen> {

  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: controller,
        child: Column(
          children: <Widget>[
            HeaderHomeCovid(offset: offset,),
            TextFieldSelectCountry(),
            CaseCovidInformation(),
            MapInformation(),
          ],
        ),
      ),
    );
  }
}


