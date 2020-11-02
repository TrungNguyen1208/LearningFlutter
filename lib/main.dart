import 'package:flutter/material.dart';
import 'package:learning_flutter/general/constants.dart';
import 'package:learning_flutter/tutorial1_login/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: LoginConst.kPrimaryColor,
          scaffoldBackgroundColor: LoginConst.kBackgroundColor,
          textTheme: TextTheme(
            headline4:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            headline5:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            button: TextStyle(color: LoginConst.kPrimaryColor),
          )),
      home: WelcomeScreen(),
    );
  }
}
