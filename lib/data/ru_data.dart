import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ru_app/networks/network.dart';

class Data extends ChangeNotifier {
  List<dynamic> cardapio = [];
  List<dynamic> cardapioDeHoje = [];

  final String toDay = DateFormat('EEEE').format(DateTime.now());
  final dateNow = DateFormat('dd-MM-yyyy');

  late bool isWeekEnd = false;
  late bool isNotWeekEnd = true;
  late bool isSexta = false;
  late bool noUpdate = false;

  void changeCardapio(List<dynamic> newCardapio) {
    cardapio = newCardapio;
    changeCardapioDeHoje(cardapio);
    getDayOfWeekEnd();
    notifyListeners();
  }

  void changeCardapioDeHoje(List<dynamic> newCardapioDeHoje) {
    List<dynamic> getCardapioDeHoje = [];

    final String hoje = dateNow.format(DateTime.now());
    final String amanha = dateNow.format(
      DateTime.now().add(
        const Duration(
          days: 1,
        ),
      ),
    );
    if (toDay != 'Sunday' && toDay != 'Saturday') {
      for (int i = 0; i < newCardapioDeHoje.length; ++i) {
        if (hoje == newCardapioDeHoje[i]['data'].toString()) {
          getCardapioDeHoje.add(newCardapioDeHoje[i]);
        }
        if (amanha == newCardapioDeHoje[i]['data'].toString()) {
          getCardapioDeHoje.add(newCardapioDeHoje[i]);
        }
      }
    }

    cardapioDeHoje = getCardapioDeHoje;

    notifyListeners();
  }

  void getDayOfWeekEnd() {
    if (toDay == 'Sunday' || toDay == 'Saturday' || toDay == 'Friday') {
      isNotWeekEnd = false;
    } else {
      isNotWeekEnd = true;
    }
    // to contro the cardapio on fridays
    if (toDay == 'Friday') {
      isSexta = true;
    } else {
      isSexta = false;
    }

    if (toDay == 'Saturday' || toDay == 'Sunday') {
      isWeekEnd = true;
    } else {
      isWeekEnd = false;
    }

    if (toDay != 'Sunday' && toDay != 'Saturday' && cardapioDeHoje.isEmpty) {
      noUpdate = true;
    } else {
      noUpdate = false;
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
    List<dynamic> cardapioUp = [];
    NetworkHelper get = NetworkHelper();

    cardapioUp = await get.getData();
    // ignore: use_build_context_synchronously

    changeCardapio(cardapioUp);
    notifyListeners();
  }
}
