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

    return weekEnd >= 2
        ? const MainListView()
        : weekEnd == 1
            ? const ToDayIsSexta()
            : const NoCardapio(
                msg: 'Sem funcionamento aos fins de semana',
                color: kWeekEndColor,
              );
  }
}
