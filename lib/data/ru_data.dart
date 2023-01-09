import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  List<dynamic> cardapio = [];

  // Data({required this.cardapio});

  void changeCardapio(List<dynamic> newCardapio) {
    cardapio = newCardapio;
    // print(cardapio);

    notifyListeners();
  }
}
