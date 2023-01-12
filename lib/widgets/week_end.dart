import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class WeekEnd extends StatelessWidget {
  const WeekEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              elevation: 10,
              color: kAlmocoColor,
              shadowColor: kSecondaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Text('hi'),
            ),
          ),
        ),
      ],
    );
  }
}
