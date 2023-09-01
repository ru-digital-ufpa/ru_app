import 'package:flutter/material.dart';

import 'package:ru_app/constants.dart';
import 'package:ru_app/customIcon/my_flutter_app_icons.dart';

class ShowInformationDialog extends StatelessWidget {
  const ShowInformationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      onPressed: (() => {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Center(
                  child: Text(
                    'Horários',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Almoço: 11:00h ás 14:00h'),
                    Text('Jantar: 17:45h ás 19:15h'),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Fechar'),
                    child: const Text(
                      'Fechar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          }),
      tooltip: 'informação do cardápio',
      child: const Icon(
        MyFlutterApp.info,
        size: 19,
      ),
    );
  }
}
