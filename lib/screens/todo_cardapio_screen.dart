import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:ru_app/constants.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_divider.dart';
import 'package:ru_app/widgets/ru_card.dart';
import 'package:ru_app/widgets/ru_sem_cardapio.dart';

// import 'package:ru_app/networks/network.dart';
// import 'dart:async';

class TodoCardapioScreen extends StatefulWidget {
  static String id = "TodoCardapioScreen";

  const TodoCardapioScreen({super.key});

  @override
  State<TodoCardapioScreen> createState() => _TodoCardapioScreenState();
}

class _TodoCardapioScreenState extends State<TodoCardapioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(
          color: kSecondaryColor,
        ),
        title: const Text(
          'Cardápio Completo da Semana',
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: kPrecoIconColor,
          onRefresh: () async {
            await context.read<Data>().getCardapio();
          },
          child: ListView.builder(
            itemCount: context.read<Data>().cardapio.length,
            itemBuilder: (context, index) {
              context.read<Data>().cardapio.sort(
                    (item1, item2) => DateFormat('dd-MM-yyyy')
                        .parse(item1['data'])
                        .compareTo(
                            DateFormat('dd-MM-yyyy').parse(item2['data'])),
                  );
              final int semAlmoco =
                  context.watch<Data>().cardapio[index]['almoco'].length;
              final String isSemAlmoco = context
                  .watch<Data>()
                  .cardapio[index]['almoco']['nomeDaRefei']
                  .toString();

              final String isSemJantar = context
                  .watch<Data>()
                  .cardapio[index]['jantar']['nomeDaRefei']
                  .toString();

              final int semJantar =
                  context.watch<Data>().cardapio[index]['jantar'].length;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  key: ObjectKey(context.watch<Data>().cardapio[index]['_id']),
                  children: [
                    RuDivider(
                      key: context.watch<Data>().cardapio[index]['id'],
                      name:
                          '${context.watch<Data>().cardapio[index]['dia'].toString()} / ${Provider.of<Data>(context).cardapio[index]['data'].toString()}',
                    ),
                    //For almoço
                    semAlmoco > 2 && isSemAlmoco != 'SEM FUNCIONAMENTO'
                        ? RuCard(
                            refeicao: context.watch<Data>().cardapio[index]
                                ['almoco']['refeicao'],
                            nomeDaRefi: context.watch<Data>().cardapio[index]
                                ['almoco']['nomeDaRefeicao'],
                            vegetariano: context.watch<Data>().cardapio[index]
                                ['almoco']['vegetarianoAlmoco'],
                            comida1: context.watch<Data>().cardapio[index]
                                ['almoco']['acompanhamento']['amo1'],
                            comida2: context.watch<Data>().cardapio[index]
                                ['almoco']['acompanhamento']['amo2'],
                            comida3: context.watch<Data>().cardapio[index]
                                ['almoco']['acompanhamento']['amo3'],
                            comida4: context.watch<Data>().cardapio[index]
                                ['almoco']['acompanhamento']['amo4'],
                            comida5: context.watch<Data>().cardapio[index]
                                ['almoco']['acompanhamento']['amo5'],
                          )
                        : SemCardapio(
                            refeicao:
                                '${context.watch<Data>().cardapio[index]['almoco']['refeicao']} ',
                            nomeDaRefi: context.watch<Data>().cardapio[index]
                                ['almoco']['nomeDaRefeicao'],
                          ),
                    //For jantar
                    semJantar > 2 && isSemJantar != 'SEM FUNCIONAMENTO'
                        ? RuCard(
                            key: context.watch<Data>().cardapio[index]['id'],
                            refeicao: context.watch<Data>().cardapio[index]
                                ['jantar']['refeicao'],
                            nomeDaRefi: context.watch<Data>().cardapio[index]
                                ['jantar']['nomeDaRefeicao'],
                            vegetariano: context.watch<Data>().cardapio[index]
                                ['jantar']['vegetarianoJantar'],
                            comida1: context.watch<Data>().cardapio[index]
                                ['jantar']['acompanhamento']['jan1'],
                            comida2: context.watch<Data>().cardapio[index]
                                ['jantar']['acompanhamento']['jan2'],
                            comida3: context.watch<Data>().cardapio[index]
                                ['jantar']['acompanhamento']['jan3'],
                            comida4: context.watch<Data>().cardapio[index]
                                ['jantar']['acompanhamento']['jan4'],
                            comida5: context.watch<Data>().cardapio[index]
                                ['jantar']['acompanhamento']['jan5'],
                          )
                        : SemCardapio(
                            nomeDaRefi: context.watch<Data>().cardapio[index]
                                ['jantar']['nomeDaRefeicao'],
                            refeicao: context.watch<Data>().cardapio[index]
                                ['jantar']['refeicao'],
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
