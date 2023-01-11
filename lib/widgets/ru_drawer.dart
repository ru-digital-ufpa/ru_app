import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/screens/todo_cardapio_screen.dart';

class RuDrawer extends StatelessWidget {
  const RuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                  ),
                  child: Text(
                    'RU DIGITAL',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ),
                RuListTile(
                  icon: Icons.food_bank,
                  title: 'Cardapio Completo',
                  onPress: () {
                    // TODO :functional
                    Navigator.pushNamed(context, TodoCardapioScreen.id);
                  },
                ),
                RuListTile(
                  icon: Icons.history_edu,
                  title: 'Histórico do RU',
                  onPress: (() {
                    // TODO:functional
                  }),
                ),
                RuListTile(
                  icon: Icons.group,
                  title: 'Sobre',
                  onPress: () {
                    // TODO:functional
                  },
                )
              ],
            ),
          ),
          const Expanded(
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

class RuListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;

  const RuListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ListTile(
        leading: Icon(
          icon,
          size: 25,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
