import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/tutorial3_covid_ui/ThemeTutorial3.dart';
import 'package:learning_flutter/tutorial3_covid_ui/screen/HomeCovidScreen.dart';

class CovidHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: ThemeTutorial3.kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyText2: TextStyle(color: ThemeTutorial3.kBodyTextColor),
          )),
      home: HomeCovidScreen(),
    );
  }
}
