import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ru_app/networks/network.dart';

class Data extends ChangeNotifier {
  List<dynamic> cardapio = [];
  List<dynamic> cardapioDeHoje = [];

  List<dynamic> listOfNews = [];

  final String toDay = DateFormat('EEEE').format(DateTime.now());
  final dateNow = DateFormat('dd-MM-yyyy');

  late bool isWeekEnd = false;
  late bool isNotWeekEnd = true;
  late bool isSexta = false;
  late bool noUpdate = false;

  /// Changes the [cardapio] property to the new cardapio and updates the [cardapioDeHoje]
  /// property accordingly.
  ///
  /// This method is called whenever the cardapio is updated. It updates the [cardapio]
  /// property with the new cardapio and then calls [changeCardapioDeHoje] to update the
  /// [cardapioDeHoje] property. It also calls [getDayOfWeekEnd] to determine if it is a
  /// weekend or not and notifies any listeners.
  ///
  /// [newCardapio] is the new cardapio.
  void changeCardapio(List<dynamic> newCardapio) {
    // Update the cardapio in the Data class.
    cardapio = newCardapio;

    // Update the cardapioDeHoje property with the new cardapio.
    changeCardapioDeHoje(cardapio);

    // Determine if it is a weekend or not.
    getDayOfWeekEnd();

    // Notify any listeners that the data has changed.
    notifyListeners();
  }

  /// Changes the [cardapioDeHoje] property to the new list of cardapios for today and tomorrow.
  ///
  /// This method is used to update the [cardapioDeHoje] property whenever the cardapio is
  /// updated. It checks the current day of the week and if it is not a weekend, it adds the
  /// cardapios for today and tomorrow to the [cardapioDeHoje] list.
  ///
  /// [newCardapioDeHoje] is the new list of cardapios.
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
      // Add the cardapios for today and tomorrow to the list
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

  /// Gets the day of the week and determines if it is a weekend or not.
  ///
  /// This method is used to determine if the cardapio should be updated or not.
  /// It checks the current day of the week and sets the [isWeekEnd] and
  /// [isNotWeekEnd] variables accordingly. It also checks if the cardapio is
  /// empty and sets the [noUpdate] variable accordingly.
  ///
  /// This method is called whenever the cardapio is updated or when the user
  /// navigates to the [MainScreen].
  void getDayOfWeekEnd() {
    // Check if the current day is Sunday, Saturday or Friday
    if (toDay == 'Sunday' || toDay == 'Saturday' || toDay == 'Friday') {
      // If it is, set isNotWeekEnd to false
      isNotWeekEnd = false;
    } else {
      // If it is not, set isNotWeekEnd to true
      isNotWeekEnd = true;
    }

    // Check if the current day is Friday
    if (toDay == 'Friday') {
      // If it is, set isSexta to true
      isSexta = true;
    } else {
      // If it is not, set isSexta to false
      isSexta = false;
    }

    // Check if the current day is Saturday or Sunday
    if (toDay == 'Saturday' || toDay == 'Sunday') {
      // If it is, set isWeekEnd to true
      isWeekEnd = true;
    } else {
      // If it is not, set isWeekEnd to false
      isWeekEnd = false;
    }

    // Check if the current day is not Sunday or Saturday and if the cardapio is
    // empty
    if (toDay != 'Sunday' && toDay != 'Saturday' && cardapioDeHoje.isEmpty) {
      // If it is, set noUpdate to true
      noUpdate = true;
    } else {
      // If it is not, set noUpdate to false
      noUpdate = false;
    }

    // Notify the listeners that the data has changed
    notifyListeners();
  }

  /// Retrieves the cardapio from the server.
  ///
  /// Returns a [Future] that completes with a [bool] indicating whether the
  /// cardapio was successfully retrieved.
  Future<bool> getCardapio() async {
    // Create a NetworkHelper instance to handle network requests.
    NetworkHelper networkHelper = NetworkHelper();

    // Retrieve the cardapio from the server using the NetworkHelper instance.
    cardapio = await networkHelper.getData();

    // Update the cardapio in the Data class and notify listeners.
    changeCardapio(cardapio);

    notifyListeners();
    // Return a Future that completes with a boolean value indicating success.
    return Future.value(true);
  }

  /// Retrieves the news from the server.
  ///
  /// This method sends a GET request to the API to retrieve the news. It then
  /// updates the [listOfNews] property with the response and notifies any
  /// listeners.
  void getNewsFromServer() async {
    // Create a NetworkHelper instance to handle network requests.
    NetworkHelper networkHelper = NetworkHelper();

    // Retrieve the news from the server using the NetworkHelper instance.
    listOfNews = await networkHelper.getNews();

    // Update the listOfNews property and notify any listeners.
    notifyListeners();
  }

  /// Called every minute by a timer to check if the cardapio has been updated.
  ///
  /// This method sends a GET request to the API to retrieve the cardapio. It
  /// then updates the [cardapio] property with the response, calls
  /// [changeCardapio] to update the [cardapioDeHoje] property, and notifies any
  /// listeners.
  ///
  /// This method is called by a timer every minute to check if the cardapio has
  /// been updated. This is necessary because the cardapio is updated every hour
  /// by the server.
  void onTimer() async {
    List<dynamic> cardapioUp = [];

    // Create a NetworkHelper instance to handle network requests.
    NetworkHelper networkHelper = NetworkHelper();

    // Retrieve the cardapio from the server using the NetworkHelper instance.
    cardapioUp = await networkHelper.getData();

    // Update the cardapio in the Data class and notify listeners.
    changeCardapio(cardapioUp);

    // Notify any listeners that the data has changed.
    notifyListeners();
  }
}
