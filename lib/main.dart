import 'package:flutter/material.dart';
import 'home_page.dart';

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
        appBarTheme: AppBarTheme(color: Colors.white),
        accentColor: Colors.white,
        unselectedWidgetColor: Colors.white,
        textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            headline3: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            headline4: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            headline5: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            )),
      ),
      home: HomePage(),
    );
  }
}
