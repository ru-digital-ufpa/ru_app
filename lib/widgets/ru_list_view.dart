import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/widgets/ru_no_cardapio.dart';
import 'package:ru_app/widgets/main_list_view.dart';
import 'package:ru_app/widgets/today_is_sexta.dart';

class RuListView extends StatelessWidget {
  const RuListView({super.key});

  @override
  Widget build(BuildContext context) {
    int weekEnd = Provider.of<Data>(context).cardapioDeHoje.length;
    bool noUpdate = Provider.of<Data>(context).noUpdate;
    bool isSexta = Provider.of<Data>(context).isSexta;

    return RefreshIndicator(
      color: kNavbarBackgroundColor,
      onRefresh: () async {
        await Provider.of<Data>(context, listen: false).getCardapio();
      },
      child: weekEnd >= 2
          ? const MainListView()
          : isSexta
              ? const ToDayIsSexta()
              : noUpdate
                  ? const NoCardapio(
                      msg: 'Aguardando atualização do cardápio.',
                      color: kWeekEndColor,
                    )
                  : const NoCardapio(
                      msg: 'Sem funcionamento aos fins de semana',
                      color: kWeekEndColor,
                    ),
    );
  }
}
