import 'package:flutter/material.dart';

import 'package:ru_app/constants.dart';
import 'package:ru_app/widgets/font_do_site.dart';

class Prices extends StatelessWidget {
  static String id = "Prices";

  const Prices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(
          color: kSecondaryColor,
        ),
        title: const Text(
          'Preço do Bandejão',
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 20,
              ),
              child: Center(
                child: Text(
                  'Valores',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                    text:
                        'Estudantes de graduação e pós-graduação da UFPA e estudantes visitantes de outras instituições de ensino superior e da educação básica:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' R\$ 1,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.justify,
                text: const TextSpan(
                    text:
                        'Servidores, terceirizados e visitantes que não sejam estudantes:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' R\$ 10,00',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
            const Expanded(child: Text('')),
            const FontDoSite(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
