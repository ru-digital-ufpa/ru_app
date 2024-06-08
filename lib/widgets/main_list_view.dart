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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myDateFormat = DateFormat('dd-MM-yyyy');
    final cardapio = Provider.of<Data>(context, listen: true).cardapioDeHoje;
    final listOfNewsAndImages =
        Provider.of<Data>(context, listen: true).listOfNews;
    final isNew = listOfNewsAndImages.isNotEmpty;

    return ListView(
      children: [
        (isNew ? const NewsCarouselSlider() : const SizedBox.shrink()),
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
              // cardapioSorted: cardapioSorted,
            );
          },
        )
      ],
    );
  }
}

class BuildNewCardapio extends StatelessWidget {
  final int index;
  // final List cardapioSorted;
  const BuildNewCardapio({
    super.key,
    required this.index,
    // required this.cardapioSorted,
  });

  @override
  Widget build(BuildContext context) {
    final dataDeHoje = DateFormat('dd-MM-yyyy').format(DateTime.now());
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
                refeicao: Provider.of<Data>(context, listen: true)
                    .cardapioDeHoje[index]['amoco']['refeicao'],
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
                refeicao: Provider.of<Data>(context, listen: true)
                    .cardapioDeHoje[index]['amoco']['refeicao'],
                nomeDaRefi: Provider.of<Data>(context, listen: true)
                    .cardapioDeHoje[index]['amoco']['nomeDaRefei'],
              ),
        semFuncionamentoJantar > 2
            ? RuCard(
                refeicao: Provider.of<Data>(context, listen: true)
                    .cardapioDeHoje[index]['jantar']['refeicao'],
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
                refeicao: Provider.of<Data>(context, listen: true)
                    .cardapioDeHoje[index]['jantar']['refeicao'],
                nomeDaRefi: Provider.of<Data>(context, listen: true)
                    .cardapioDeHoje[0]['jantar']['nomeDaRefei'],
              ),
      ],
    );
  }
}
