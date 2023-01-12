import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/networks/network.dart';
import 'package:ru_app/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/data/ru_data.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCardapio();
  }

  void getCardapio() async {
    List<dynamic> cardapio = [];

    NetworkHelper get = NetworkHelper();

    cardapio = await get.getData();
    Provider.of<Data>(context, listen: false).changeCardapio(cardapio);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, MainScreen.id);
  }

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
              color: kNavbarBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
