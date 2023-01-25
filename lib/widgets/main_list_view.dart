import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_card.dart';
import 'package:ru_app/widgets/ru_sem_cardapio.dart';

class MainListView extends StatelessWidget {
  const MainListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<Data>(context, listen: true).cardapioDeHoje.length,
      itemBuilder: (context, index) {
        Provider.of<Data>(context, listen: true).cardapioDeHoje.sort(
            (item1, item2) =>
                item1['data'].toString().compareTo(item2['data']));
        final int semAlmoco = Provider.of<Data>(context, listen: true)
            .cardapioDeHoje[index]['amoco']
            .length;
        final String isSemAlmoco = Provider.of<Data>(context, listen: true)
            .cardapioDeHoje[index]['amoco']['nomeDaRefei']
            .toString();

        final String isSemJantar = Provider.of<Data>(context, listen: true)
            .cardapioDeHoje[index]['jantar']['nomeDaRefei']
            .toString();

        final int semJantar = Provider.of<Data>(context, listen: true)
            .cardapioDeHoje[index]['jantar']
            .length;
        return Column(
          key: Provider.of<Data>(context).cardapio[index]['id'],
          children: [
            index == 0
                ? const RuDivider(name: 'Hoje')
                : const RuDivider(name: 'Amanhã'),
            semAlmoco > 2 && isSemAlmoco != 'SEM FUNCIONAMENTO'
                ? RuCard(
                    refeicao:
                        '${Provider.of<Data>(context, listen: true).cardapioDeHoje[index]['amoco']['refeicao']} 11:00 - 14:00',
                    nomeDaRefi: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['nomeDaRefei'],
                    vegetariano: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['vegetariano1'],
                    comida1: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['ingredintes']['amo1'],
                    comida2: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['ingredintes']['amo2'],
                    comida3: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['ingredintes']['amo3'],
                    comida4: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['ingredintes']['amo4'],
                    comida5: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['ingredintes']['amo5'],
                  )
                : SemCardapio(
                    refeicao:
                        '${Provider.of<Data>(context, listen: true).cardapioDeHoje[index]['amoco']['refeicao']} 11:00 - 14:00',
                    nomeDaRefi: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['amoco']['nomeDaRefei'],
                  ),
            //For jantar
            semJantar > 2 && isSemJantar != 'SEM FUNCIONAMENTO'
                ? RuCard(
                    refeicao:
                        '${Provider.of<Data>(context, listen: true).cardapioDeHoje[index]['jantar']['refeicao']}  17:45 - 19:15',
                    nomeDaRefi: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['nomeDaRefei'],
                    vegetariano: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['vegetariano2'],
                    comida1: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['ingredintes']['jan1'],
                    comida2: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['ingredintes']['jan2'],
                    comida3: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['ingredintes']['jan3'],
                    comida4: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['ingredintes']['jan4'],
                    comida5: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['ingredintes']['jan5'],
                  )
                : SemCardapio(
                    nomeDaRefi:
                        '${Provider.of<Data>(context, listen: true).cardapioDeHoje[index]['jantar']['nomeDaRefei']}  17:45 - 19:15',
                    refeicao: Provider.of<Data>(context, listen: true)
                        .cardapioDeHoje[index]['jantar']['refeicao'],
                  ),
          ],
        );
      },
    );
  }
}
