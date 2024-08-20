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
    final cardapio = context.watch<Data>().cardapioDeHoje;
    final listOfNewsAndImages = context.watch<Data>().listOfNews;
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
    final cardapio = context.watch<Data>().cardapioDeHoje;

    bool isTemCardapioDeHpje = dataDeHoje == cardapio[index]['data'].toString();

    final int semFuncionamentoAlmoco = cardapio[index]['almoco'].length;

    final int semFuncionamentoJantar = cardapio[index]['jantar'].length;

    return Column(
      key: ObjectKey(Provider.of<Data>(context).cardapio[index]['_id']),
      children: [
        isTemCardapioDeHpje
            ? const RuDivider(name: 'Hoje')
            : const RuDivider(name: 'Amanhã'),
        semFuncionamentoAlmoco > 2
            ? RuCard(
                refeicao: context.watch<Data>().cardapioDeHoje[index]['almoco']
                    ['refeicao'],
                nomeDaRefi: context.watch<Data>().cardapioDeHoje[index]
                    ['almoco']['nomeDaRefeicao'],
                vegetariano: context.watch<Data>().cardapioDeHoje[index]
                    ['almoco']['vegetarianoAlmoco'],
                comida1: context.watch<Data>().cardapioDeHoje[index]['almoco']
                    ['acompanhamento']['amo1'],
                comida2: context.watch<Data>().cardapioDeHoje[index]['almoco']
                    ['acompanhamento']['amo2'],
                comida3: context.watch<Data>().cardapioDeHoje[index]['almoco']
                    ['acompanhamento']['amo3'],
                comida4: context.watch<Data>().cardapioDeHoje[index]['almoco']
                    ['acompanhamento']['amo4'],
                comida5: context.watch<Data>().cardapioDeHoje[index]['almoco']
                    ['acompanhamento']['amo5'],
              )
            : SemCardapio(
                refeicao: context.watch<Data>().cardapioDeHoje[index]['almoco']
                    ['refeicao'],
                nomeDaRefi: context.watch<Data>().cardapioDeHoje[index]
                    ['almoco']['nomeDaRefeicao'],
              ),
        semFuncionamentoJantar > 2
            ? RuCard(
                refeicao: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['refeicao'],
                nomeDaRefi: context.watch<Data>().cardapioDeHoje[index]
                    ['jantar']['nomeDaRefeicao'],
                vegetariano: context.watch<Data>().cardapioDeHoje[index]
                    ['jantar']['vegetarianoJantar'],
                comida1: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['acompanhamento']['jan1'],
                comida2: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['acompanhamento']['jan2'],
                comida3: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['acompanhamento']['jan3'],
                comida4: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['acompanhamento']['jan4'],
                comida5: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['acompanhamento']['jan5'],
              )
            : SemCardapio(
                refeicao: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['refeicao'],
                nomeDaRefi: context.watch<Data>().cardapioDeHoje[0]['jantar']
                    ['nomeDaRefeicao'],
              ),
      ],
    );
  }
}
