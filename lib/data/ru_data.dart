import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ru_app/networks/network.dart';

class Data extends ChangeNotifier {
  List<dynamic> cardapio = [];
  List<dynamic> cardapioDeHoje = [];

  List<dynamic> listOfNews = [
    // {
    //   'imageUrl':
    //       'https://portal.ufpa.br/images/RU_B%C3%81SICO_-_Foto_Alexandre_Moraes-15.jpg',
    //   'isImage': true,
    // },
    // {
    //   'imageUrl': 'https://portal.ufpa.br/images/373x212-RUsemcopos1.jpg',
    //   'isImage': true,
    // },
    // {
    //   'imageUrl':
    //       'https://3.bp.blogspot.com/-lhIENiC8Abw/V9XN0zSzs1I/AAAAAAAAGSg/S0onPjt8JLAhWwGbi_4dMJ4AKPVjD5APgCLcB/s1600/UFPA%2B-%2BRU%2BProfissional.jpg',
    //   'isImage': true,
    // },
    // {
    //   'imageUrl':
    //       'https://portal.ufpa.br/images/Acesso_F%C3%A1cil_RU_-_ASCOM_UFPA.jpg',
    //   'isImage': true,
    // },
    // {
    //   'imageUrl':
    //       'https://www.portal.ufpa.br/images/imagens_ufpa/20.08.2018_Novo_Sistema_do_RU_B%C3%A1sico_-_Foto_Alexandre_de_Moraes_site5-373x212.jpg',
    //   'isImage': true,
    // },
    // {
    //   'imageUrl':
    //       'https://www.portal.ufpa.br/images/imagens_ufpa/20.08.2018_Novo_Sistema_do_RU_B%C3%A1sico_-_Foto_Alexandre_de_Moraes_site2-373x212.jpg',
    //   'isImage': true,
    // },
    // {
    //   'imageUrl':
    //       'https://www.portal.ufpa.br/images/imagens_ufpa/20.08.2018_Novo_Sistema_do_RU_B%C3%A1sico_-_Foto_Alexandre_de_Moraes_site4.jpg',
    //   'isImage': true,
    // },
    // {
    //   'imageUrl':
    //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX9R4ZuMZeKJSz95-Hw6FVNH1MgaHEL3R8Rw&usqp=CAU',
    //   'isImage': true,
    // },
    // {
    //   'title': 'OBS:',
    //   'msg':
    //       'Este aplicativo é um projeto de um aluno da Universidade Federal do Pará - UFPA, portanto não é oficial da Superintendência de Assistência Estudantil – SAEST/UFPA.',
    //   'isImage': false,
    //   'textColor': 0xFFFAB57A
    // }
  ];

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

  void getNewsFromServer() async {
    NetworkHelper get = NetworkHelper();
    listOfNews = await get.getNews();
    notifyListeners();
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
