import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/widgets/ru_drawer.dart';
import 'package:ru_app/widgets/ru_list_view.dart';
import 'package:ru_app/data/ru_data.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(minutes: 30),
      (timer) {
        Provider.of<Data>(context, listen: false).onTimer();
      },
    );
  }

  List<dynamic> updateCardapioDoDia = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(
          color: kNavbarBackgroundColor,
        ),
        title: const Text(
          'RU DIGITAL',
          style: TextStyle(
            color: kNavbarBackgroundColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: kSecondaryColor,
              child: Image.asset(
                'images/ufpa_logo.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: RuListView(),
      ),
      drawer: const RuDrawer(),
    );
  }
}
