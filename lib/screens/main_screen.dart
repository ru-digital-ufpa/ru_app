import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ru_app/constants.dart';
import 'package:ru_app/drawer/ru_drawer.dart';
import 'package:ru_app/widgets/ru_list_view.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/information_dialog.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(minutes: 10),
      (timer) {
        context.read<Data>().onTimer();
        // Provider.of<FirebaseMessagingService>(context, listen: false)
        //     .getDeviceFirebaseToken();
        context.read<Data>().getNewsFromServer();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<dynamic> updateCardapioDoDia = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(
          color: kSecondaryColor,
        ),
        title: const Text(
          'RU DIGITAL',
          style: TextStyle(
            color: kSecondaryColor,
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
              radius: 24,
              backgroundColor: kSecondaryColor,
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Image.asset(
                  'images/ufpa_logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: RuListView(),
      ),
      floatingActionButton: const ShowInformationDialog(),
      drawer: const RuDrawer(),
    );
  }
}
