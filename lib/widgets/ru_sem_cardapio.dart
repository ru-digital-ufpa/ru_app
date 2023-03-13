import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class SemCardapio extends StatelessWidget {
  final String refeicao;
  final String nomeDaRefi;

  const SemCardapio({
    super.key,
    required this.nomeDaRefi,
    required this.refeicao,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 5,
          color: kSemCardapioColor,
          shadowColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 10),
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
                  height: 10,
                ),
                Text(
                  nomeDaRefi,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
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
