import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/widgets/ru_card.dart';
import 'package:ru_app/networks/network.dart';
import 'dart:convert';
import 'package:http/http.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    print("object");
    getCardapio();
  }

  void getCardapio() async {
    NetworkHelper g = NetworkHelper();
    var m = await g.getData();
    print(m[0]['amoco']['vegetariano1']);
  }

  Widget build(BuildContext context) {
    //getCardapio();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
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
      body: SafeArea(
        child: Container(
          color: kBackgroundColor,
          margin: const EdgeInsets.only(right: 5, left: 5),
          child: Column(
            children: <Widget>[
              //TODO: slider window
              Expanded(
                child: Container(
                  child: Text('hi'),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      RuCard(
                        refeicao: "hi",
                        nomeDaRefi: "jk",
                        comida1: 'lo',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: kNavbarBackgroundColor,
      //   child: Row(
      //     children: [
      //       Icon(
      //         Icons.menu,
      //         color: kSecondaryColor,
      //         size: 50,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
