import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ru_app/networks/network.dart';

class Data extends ChangeNotifier {
  List<dynamic> cardapio = [];
  List<dynamic> cardapioDeHoje = [];
  // late bool isWeekEnd = false;
  // late bool isSexta = false;
  late bool noUpdate = false;

  void changeCardapio(List<dynamic> newCardapio) {
    cardapio = newCardapio;
    changeCardapioDeHoje(cardapio);
    getDayOfWeekEnd();
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
    }
    cardapioDeHoje = getCardapioDeHoje;

    notifyListeners();
  }

  void getDayOfWeekEnd() {
    final String toDay = DateFormat('EEEE').format(DateTime.now());

    // if (toDay == 'Thursday' || toDay == 'Saturday' || toDay == 'Sunday') {
    //   isSexta = !isSexta;
    // }
    // if (toDay == 'Saturday' || toDay == 'Sunday') {
    //   isWeekEnd = !isWeekEnd;
    // }
    if (toDay != 'Sunday' && toDay != 'Saturday') {
      noUpdate = true;
    }
    notifyListeners();
  }

  Future<bool> getCardapio() async {
    List<dynamic> cardapio = [];

    NetworkHelper get = NetworkHelper();

    cardapio = await get.getData();
    // ignore: use_build_context_synchronously
    changeCardapio(cardapio);
    return Future.value(true);

    // ignore: use_build_context_synchronously
  }

  void onTimer() async {
    List<dynamic> cardapio = [];
    NetworkHelper get = NetworkHelper();

    cardapio = await get.getData();
    // ignore: use_build_context_synchronously
    changeCardapio(cardapio);
    notifyListeners();
  }
}
