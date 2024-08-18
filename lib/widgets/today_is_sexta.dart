import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ru_app/constants.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_card.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_no_cardapio.dart';
import 'package:ru_app/widgets/ru_sem_cardapio.dart';

import '../news/news_carousel_slider.dart';

class ToDayIsSexta extends StatelessWidget {
  const ToDayIsSexta({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = context.watch<Data>().cardapioDeHoje.length - 1;
    final int semAlmoco =
        context.watch<Data>().cardapioDeHoje[index]['almoco'].length;

    final String isSemAlmoco = context
        .watch<Data>()
        .cardapioDeHoje[index]['almoco']['nomeDaRefeicao']
        .toString();

    final String isSemJantar = context
        .watch<Data>()
        .cardapioDeHoje[index]['jantar']['nomeDaRefeicao']
        .toString();

    final int semJantar =
        context.watch<Data>().cardapioDeHoje[index]['jantar'].length;

    final listOfNewsAndImages =
        Provider.of<Data>(context, listen: true).listOfNews;

    bool isNews = listOfNewsAndImages.isNotEmpty;

    return ListView(
      children: [
        isNews ? const NewsCarouselSlider() : const SizedBox.shrink(),
        const RuDivider(name: 'Hoje'),
        //For almoço
        semAlmoco > 2 && isSemAlmoco != 'SEM FUNCIONAMENTO'
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
        //For jantar
        semJantar > 2 && isSemJantar != 'SEM FUNCIONAMENTO'
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
                nomeDaRefi: context.watch<Data>().cardapioDeHoje[index]
                    ['jantar']['nomeDaRefeicao'],
                refeicao: context.watch<Data>().cardapioDeHoje[index]['jantar']
                    ['refeicao'],
              ),
        const RuDivider(name: 'Amanhã'),
        const NoCardapio(
          msg: 'Sem funcionamento aos sábados',
          color: kSextaColor,
        ),
      ],
    );
  }
}
