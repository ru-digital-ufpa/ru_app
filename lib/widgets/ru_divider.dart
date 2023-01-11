import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class RuDivider extends StatelessWidget {
  final String name;

  const RuDivider({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: kDividerColor,
      margin: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 5,
        bottom: 5,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
