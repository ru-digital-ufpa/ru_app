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
    final bool weekEnd = Provider.of<Data>(context).isWeekEnd;
    final bool isNotWeekEnd = Provider.of<Data>(context).isNotWeekEnd;
    final bool noUpdate = Provider.of<Data>(context).noUpdate;
    final bool isSexta = Provider.of<Data>(context).isSexta;
    final List<dynamic> cardapioDeHoje =
        Provider.of<Data>(context).cardapioDeHoje;

    return RefreshIndicator(
      color: kNavbarBackgroundColor,
      onRefresh: () async {
        await Provider.of<Data>(context, listen: false).getCardapio();
      },
      child: isNotWeekEnd && cardapioDeHoje.isNotEmpty
          ? const MainListView()
          : isSexta
              ? const ToDayIsSexta()
              : noUpdate
                  ? const NoCardapio(
                      msg: 'Aguardando atualização do cardápio.',
                      color: kWeekEndColor,
                    )
                  : weekEnd
                      ? const NoCardapio(
                          msg: 'Sem funcionamento aos fins de semana',
                          color: kWeekEndColor,
                        )
                      : ListView(),
    );
  }
}
