import 'package:flutter/material.dart';

class RuDrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;
  final Color? iconColor;

  const RuDrawerListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
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
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
