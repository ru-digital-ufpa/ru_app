import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class RuCard extends StatelessWidget {
  final String refeicao;
  final String nomeDaRefi;
  final String? vegetariano;
  final String? comida1;
  final String? comida2;
  final String? comida3;
  final String? comida4;
  final String? comida5;

  RuCard({
    required this.refeicao,
    required this.nomeDaRefi,
    this.vegetariano = '',
    this.comida1 = '',
    this.comida2 = '',
    this.comida3 = '',
    this.comida4 = '',
    this.comida5 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 300,
      // ignore: prefer_const_constructors
      child: Card(
        elevation: 10,
        color: Colors.white,
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                nomeDaRefi,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Vegetariano:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$vegetariano',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$comida1',
                      style: kTextStyle,
                    ),
                    Text(
                      '$comida2',
                      style: kTextStyle,
                    ),
                    Text(
                      '$comida3',
                      style: kTextStyle,
                    ),
                    Text(
                      '$comida4',
                      style: kTextStyle,
                    ),
                    Text(
                      '$comida5',
                      style: kTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
