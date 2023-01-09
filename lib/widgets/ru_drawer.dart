import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class RuDrawer extends StatelessWidget {
  const RuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Text(
              'RU Digital',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Cardapio Completo'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Histórico do RU'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Sobre'),
          ),
        ],
      ),
    );
  }
}
