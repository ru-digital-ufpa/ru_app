import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_card.dart';
import 'package:ru_app/widgets/ru_sem_cardapio.dart';
import 'package:ru_app/news/news_carousel_slider.dart';

class MainListView extends StatelessWidget {
  const MainListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myDateFormat = DateFormat('dd-MM-yyyy');
    final cardapio = Provider.of<Data>(context, listen: true).cardapioDeHoje;

    return ListView(
      children: [
        const NewsCarouselSlider(),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: cardapio.length,
          itemBuilder: (context, index) {
            cardapio.sort(
              (item1, item2) => myDateFormat.parse(item1['data']).compareTo(
                    myDateFormat.parse(item2['data']),
                  ),
            );

            //retuing view
            return BuildNewCardapio(
              index: index,
            );
          },
        )
      ],
    );
  }
}

class BuildNewCardapio extends StatelessWidget {
  final int index;
  const BuildNewCardapio({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final dataDeHoje =
        DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: -3)));
    final cardapio = Provider.of<Data>(context, listen: true).cardapioDeHoje;

    bool isTemCardapioDeHpje = dataDeHoje == cardapio[index]['data'].toString();

    final int semFuncionamentoAlmoco = cardapio[index]['amoco'].length;

    final int semFuncionamentoJantar = cardapio[index]['jantar'].length;

    return Column(
      key: ObjectKey(Provider.of<Data>(context).cardapio[index]['_id']),
      children: [
        isTemCardapioDeHpje
            ? const RuDivider(name: 'Hoje')
            : const RuDivider(name: 'Amanhã'),
        semFuncionamentoAlmoco > 2
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
        semFuncionamentoJantar > 2
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
                refeicao:
                    '${Provider.of<Data>(context, listen: true).cardapioDeHoje[0]['jantar']['refeicao']} 17:45 - 19:15',
                nomeDaRefi: Provider.of<Data>(context, listen: true)
                    .cardapioDeHoje[0]['jantar']['nomeDaRefei'],
              ),
      ],
    );
  }
}
