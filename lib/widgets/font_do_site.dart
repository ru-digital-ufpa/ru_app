import 'package:flutter/material.dart';

import 'package:ru_app/constants.dart';

class FontDoSite extends StatelessWidget {
  const FontDoSite({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: const TextSpan(
          text: 'Fonte:',
          style: TextStyle(
            color: kFonteDoSitesColor,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' Site oficial da Saest UFPA',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ]),
    );
  }
}
