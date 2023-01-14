import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_card.dart';
import 'package:ru_app/widgets/ru_sem_cardapio.dart';

class TodoCardapioScreen extends StatelessWidget {
  static String id = "TodoCardapioScreen";

  const TodoCardapioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(
          color: kNavbarBackgroundColor,
        ),
        title: const Text(
          'Cardapio Completo da Semana',
          style: TextStyle(
            color: kNavbarBackgroundColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Provider.of<Data>(context).cardapio.length,
          itemBuilder: (context, index) {
            Provider.of<Data>(context).cardapio.sort((item1, item2) =>
                item1['data'].toString().compareTo(item2['data']));
            final int semAlmoco =
                Provider.of<Data>(context).cardapio[index]['amoco'].length;
            final String isSemAlmoco = Provider.of<Data>(context)
                .cardapio[index]['amoco']['nomeDaRefei']
                .toString();

            final String isSemJantar = Provider.of<Data>(context)
                .cardapio[index]['jantar']['nomeDaRefei']
                .toString();

            final int semJantar =
                Provider.of<Data>(context).cardapio[index]['jantar'].length;
            return Column(
              children: [
                RuDivider(
                  name:
                      '${Provider.of<Data>(context).cardapio[index]['dia'].toString()} / ${Provider.of<Data>(context).cardapio[index]['data'].toString()}',
                ),
                //For almoço
                semAlmoco > 2 && isSemAlmoco != 'SEM FUNCIONAMENTO'
                    ? RuCard(
                        refeicao: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['refeicao'],
                        nomeDaRefi: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['nomeDaRefei'],
                        vegetariano: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['vegetariano1'],
                        comida1: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['ingredintes']['amo1'],
                        comida2: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['ingredintes']['amo2'],
                        comida3: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['ingredintes']['amo3'],
                        comida4: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['ingredintes']['amo4'],
                        comida5: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['ingredintes']['amo5'],
                      )
                    : SemCardapio(
                        refeicao:
                            '${Provider.of<Data>(context).cardapio[index]['amoco']['refeicao']} ',
                        nomeDaRefi: Provider.of<Data>(context).cardapio[index]
                            ['amoco']['nomeDaRefei'],
                      ),
                //For jantar
                semJantar > 2 && isSemJantar != 'SEM FUNCIONAMENTO'
                    ? RuCard(
                        refeicao: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['refeicao'],
                        nomeDaRefi: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['nomeDaRefei'],
                        vegetariano: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['vegetariano2'],
                        comida1: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['ingredintes']['jan1'],
                        comida2: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['ingredintes']['jan2'],
                        comida3: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['ingredintes']['jan3'],
                        comida4: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['ingredintes']['jan4'],
                        comida5: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['ingredintes']['jan5'],
                      )
                    : SemCardapio(
                        nomeDaRefi: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['nomeDaRefei'],
                        refeicao: Provider.of<Data>(context).cardapio[index]
                            ['jantar']['refeicao'],
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
