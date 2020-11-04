import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial1_login/WelcomeScreen.dart';

import 'ThemeTutorial1.dart';

class Tutorial1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        title: '',
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: ThemeTutorial1.kPrimaryColor,
            scaffoldBackgroundColor: ThemeTutorial1.kBackgroundColor,
            textTheme: TextTheme(
              headline4:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              headline5:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              button: TextStyle(color: ThemeTutorial1.kPrimaryColor),
            )),
        home: WelcomeScreen(),
      ),
    );
  }
}