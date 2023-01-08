import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

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
