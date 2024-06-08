import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ru_app/constants.dart';
import 'package:ru_app/screens/main_screen.dart';
import 'package:ru_app/data/ru_data.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';

  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final dataProvider = Provider.of<Data>(context, listen: false);

    final cardapio = await dataProvider.getCardapio();

    if (cardapio) {
      dataProvider.getNewsFromServer();
      Navigator.pushReplacementNamed(context, MainScreen.id);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/ru_digital_logo.png'),
            const CircularProgressIndicator(
              color: kSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
