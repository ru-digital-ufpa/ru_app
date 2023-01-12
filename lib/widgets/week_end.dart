import 'package:flutter/material.dart';
import 'package:ru_app/widgets/ru_no_cardapio.dart';

class WeekEnd extends StatelessWidget {
  const WeekEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NoCardapio(
          msg: 'helo',
        ),
      ],
    );
  }
}
