import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_card.dart';

class TodoCardapioScreen extends StatelessWidget {
  static String id = "TodoCardapioScreen";

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
            return Column(
              children: [
                RuDivider(
                  name:
                      '${Provider.of<Data>(context).cardapio[index]['dia'].toString()} / ${Provider.of<Data>(context).cardapio[index]['data'].toString()}',
                ),
                RuCard(
                  refeicao: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['refeicao'],
                  nomeDaRefi: Provider.of<Data>(context).cardapio[index]
                      ['amoco']['nomeDaRefei'],
                  vegetariano: Provider.of<Data>(context).cardapio[index]
                      ['amoco']['vegetariano1'],
                  comida1: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo1'],
                  comida2: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo2'],
                  comida3: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo3'],
                  comida4: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo4'],
                  comida5: Provider.of<Data>(context).cardapio[index]['amoco']
                      ['ingredintes']['amo5'],
                  refeicaoJantar: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['refeicao'],
                  nomeDaRefiJantar: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['nomeDaRefei'],
                  vegetarianoJantar: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['vegetariano2'],
                  comidaJantar1: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan1'],
                  comidaJantar2: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan2'],
                  comidaJantar3: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan3'],
                  comidaJantar4: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan4'],
                  comidaJantar5: Provider.of<Data>(context).cardapio[index]
                      ['jantar']['ingredintes']['jan5'],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
