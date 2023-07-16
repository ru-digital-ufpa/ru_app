import 'package:flutter/material.dart';

class RuDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;
  final Color? iconColor;
  final double fontSize;

  const RuDrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
    required this.fontSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ListTile(
        dense: true,
        leading: Icon(
          icon,
          size: 30,
          color: iconColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
