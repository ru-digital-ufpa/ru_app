import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class NoCardapio extends StatelessWidget {
  final String msg;
  final Color? color;
  final Color? textColor;

  const NoCardapio({
    Key? key,
    required this.msg,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          elevation: 2,
          color: color,
          shadowColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                msg,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
