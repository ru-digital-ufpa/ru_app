import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Data extends ChangeNotifier {
  List<dynamic> cardapio = [];
  List<dynamic> cardapioDeHoje = [];

  void changeCardapio(List<dynamic> newCardapio) {
    cardapio = newCardapio;
    changeCardapioDeHoje(cardapio);
    notifyListeners();
  }

  void changeCardapioDeHoje(List<dynamic> newCardapioDeHoje) {
    List<dynamic> getCardapioDeHoje = [];

    final String hoje = DateFormat('dd-MM-yyyy').format(
      DateTime.now().add(
        Duration(
          days: -5,
        ),
      ),
    );
    final String amanha = DateFormat('dd-MM-yyyy').format(
      DateTime.now().add(
        Duration(
          days: -4,
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
}
