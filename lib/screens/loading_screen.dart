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
    _loadData(context);
  }

  Future<void> _loadData(BuildContext context) async {
    // final dataProvider = context.read<Data>();

    await context.read<Data>().getCardapio();
    navigateToMainScreen();
  }

  /// Navigates to the [MainScreen] after the data is loaded.
  ///
  /// This method is called in the [initState] method of the [State] class.
  /// It uses the [Navigator] to push a new route on the top of the navigator
  /// that most tightly encloses the given [BuildContext].
  ///
  /// The [MainScreen] is pushed with the [MaterialPageRoute] which is the
  /// default route type.
  void navigateToMainScreen() {
    context.read<Data>().getNewsFromServer();
    Navigator.of(context).pushReplacementNamed(MainScreen.id);
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
            Image.asset(
              'images/ru_digital_logo.png',
              semanticLabel: 'RU digital app logo',
            ),
            const CircularProgressIndicator(
              color: kSecondaryColor,
              semanticsLabel: 'RU digital app loading',
            ),
          ],
        ),
      ),
    );
  }
}
