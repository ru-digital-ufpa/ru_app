import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class SemCardapio extends StatelessWidget {
  final String refeicao;
  final String nomeDaRefi;

  const SemCardapio({
    Key? key,
    required this.nomeDaRefi,
    required this.refeicao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 300,
      // ignore: prefer_const_constructors
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          elevation: 10,
          color: refeicao == 'ALMOÇO' ? kAlmocoColor : kJantarColor,
          shadowColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Text(
                  refeicao,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  nomeDaRefi,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
