import 'package:flutter/material.dart';
import 'package:ru_app/screens/loading_screen.dart';
import 'package:ru_app/screens/main_screen.dart';
import 'package:ru_app/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
      ),
      home: MainScreen(),
    );
  }
}
