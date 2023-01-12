import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_card.dart';

class MainListView extends StatelessWidget {
  const MainListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<Data>(context).cardapioDeHoje.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            index == 0
                ? const RuDivider(name: 'Hoje')
                : const RuDivider(name: 'Amanhã'),
            RuCard(
              refeicao: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['amoco']['refeicao'],
              nomeDaRefi: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['amoco']['nomeDaRefei'],
              vegetariano: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['amoco']['vegetariano1'],
              comida1: Provider.of<Data>(context).cardapioDeHoje[index]['amoco']
                  ['ingredintes']['amo1'],
              comida2: Provider.of<Data>(context).cardapioDeHoje[index]['amoco']
                  ['ingredintes']['amo2'],
              comida3: Provider.of<Data>(context).cardapioDeHoje[index]['amoco']
                  ['ingredintes']['amo3'],
              comida4: Provider.of<Data>(context).cardapioDeHoje[index]['amoco']
                  ['ingredintes']['amo4'],
              comida5: Provider.of<Data>(context).cardapioDeHoje[index]['amoco']
                  ['ingredintes']['amo5'],
              refeicaoJantar: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['jantar']['refeicao'],
              nomeDaRefiJantar: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['jantar']['nomeDaRefei'],
              vegetarianoJantar: Provider.of<Data>(context)
                  .cardapioDeHoje[index]['jantar']['vegetariano2'],
              comidaJantar1: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['jantar']['ingredintes']['jan1'],
              comidaJantar2: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['jantar']['ingredintes']['jan2'],
              comidaJantar3: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['jantar']['ingredintes']['jan3'],
              comidaJantar4: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['jantar']['ingredintes']['jan4'],
              comidaJantar5: Provider.of<Data>(context).cardapioDeHoje[index]
                  ['jantar']['ingredintes']['jan5'],
            ),
          ],
        );
      },
    );
  }
}
