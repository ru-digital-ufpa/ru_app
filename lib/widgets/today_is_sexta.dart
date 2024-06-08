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
    final int index = Provider.of<Data>(context).cardapioDeHoje.length - 1;
    final int semAlmoco =
        Provider.of<Data>(context).cardapioDeHoje[index]['amoco'].length;

    final String isSemAlmoco = Provider.of<Data>(context)
        .cardapioDeHoje[index]['amoco']['nomeDaRefei']
        .toString();

    final String isSemJantar = Provider.of<Data>(context)
        .cardapioDeHoje[index]['jantar']['nomeDaRefei']
        .toString();

    final int semJantar =
        Provider.of<Data>(context).cardapioDeHoje[index]['jantar'].length;

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
                refeicao: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['refeicao'],
                nomeDaRefi: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['nomeDaRefei'],
                vegetariano: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['vegetariano1'],
                comida1: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['ingredintes']['amo1'],
                comida2: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['ingredintes']['amo2'],
                comida3: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['ingredintes']['amo3'],
                comida4: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['ingredintes']['amo4'],
                comida5: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['ingredintes']['amo5'],
              )
            : SemCardapio(
                refeicao: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['refeicao'],
                nomeDaRefi: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['amoco']['nomeDaRefei'],
              ),
        //For jantar
        semJantar > 2 && isSemJantar != 'SEM FUNCIONAMENTO'
            ? RuCard(
                refeicao: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['refeicao'],
                nomeDaRefi: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['nomeDaRefei'],
                vegetariano: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['vegetariano2'],
                comida1: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['ingredintes']['jan1'],
                comida2: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['ingredintes']['jan2'],
                comida3: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['ingredintes']['jan3'],
                comida4: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['ingredintes']['jan4'],
                comida5: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['ingredintes']['jan5'],
              )
            : SemCardapio(
                nomeDaRefi: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['nomeDaRefei'],
                refeicao: Provider.of<Data>(context).cardapioDeHoje[index]
                    ['jantar']['refeicao'],
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
