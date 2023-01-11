import 'package:flutter/material.dart';
import 'package:ru_app/screens/loading_screen.dart';
import 'package:ru_app/screens/main_screen.dart';
import 'package:ru_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/screens/todo_cardapio_screen.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => Data(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
      ),
      color: kPrimaryColor,
      // home: CardapioDeHoje(),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        MainScreen.id: (context) => MainScreen(),
        TodoCardapioScreen.id: (context) => TodoCardapioScreen(),
      },
    );
  }
}
