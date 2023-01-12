import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Data extends ChangeNotifier {
  List<dynamic> cardapio = [];
  List<dynamic> cardapioDeHoje = [];
  late bool isWeekEnd = false;
  late bool isSexta = false;

  void changeCardapio(List<dynamic> newCardapio) {
    cardapio = newCardapio;
    changeCardapioDeHoje(cardapio);
    goingToWeekEnd();
    notifyListeners();
  }

  void changeCardapioDeHoje(List<dynamic> newCardapioDeHoje) {
    List<dynamic> getCardapioDeHoje = [];

    final String hoje = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final String amanha = DateFormat('dd-MM-yyyy').format(
      DateTime.now().add(
        const Duration(
          days: 1,
        ),
      ),
    );

    for (int i = 0; i < newCardapioDeHoje.length; ++i) {
      if (hoje == newCardapioDeHoje[i]['data'].toString()) {
        getCardapioDeHoje.add(newCardapioDeHoje[i]);
      }
      if (amanha == newCardapioDeHoje[i]['data'].toString()) {
        getCardapioDeHoje.add(newCardapioDeHoje[i]);
      }
      // print(cardapio[i]['data']);
    }
    cardapioDeHoje = getCardapioDeHoje;
    // print(hoje);
    // print(amanha);
    // print(getCardapioDeHoje);
    notifyListeners();
  }

  void goingToWeekEnd() {
    final String toDay = DateFormat('EEEE').format(DateTime.now());

    if (toDay == 'Thursday' || toDay == 'Saturday' || toDay == 'Sunday') {
      isSexta = !isSexta;
    }
    if (toDay == 'Saturday' || toDay == 'Sunday') {
      isWeekEnd = !isWeekEnd;
    }
    notifyListeners();
  }
}
