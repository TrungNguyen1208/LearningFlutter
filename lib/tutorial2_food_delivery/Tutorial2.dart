import 'package:flutter/material.dart';
import 'package:learning_flutter/tutorial2_food_delivery/HomeTutorial2.dart';
import 'package:learning_flutter/tutorial2_food_delivery/ThemeTutorial2.dart';

class Tutorial2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
            fontFamily: "Poppins",
            scaffoldBackgroundColor: ThemeTutorial2.kWhiteColor,
            primaryColor: ThemeTutorial2.kPrimaryColor,
            textTheme: TextTheme(
              headline5: TextStyle(fontWeight: FontWeight.bold),
              headline6: TextStyle(fontWeight: FontWeight.bold),
              button: TextStyle(fontWeight: FontWeight.bold),
              bodyText2: TextStyle(color: ThemeTutorial2.kTextColor),
            )),
        home: HomeTutorial2(),
      ),
    );
  }
}
