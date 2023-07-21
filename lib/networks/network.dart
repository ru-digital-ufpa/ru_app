import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  List<dynamic> cardapio = [];
  List<dynamic> news = [];

  NetworkHelper();

  Future getData() async {
    Uri url = Uri.parse('https://prinako-ru.cyclic.app/api');
    // Uri url = Uri.parse('http://ru.server.net/api');

    http.Response response = await http.get(
      url,
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      cardapio = json;
      //print(cardapio);
      return cardapio;
    } else {
      // print(response.statusCode);
    }
  }

  postUserToken({String? token}) async {
    Uri url = Uri.parse('https://prinako-ru.cyclic.app/token');
    // Uri url = Uri.parse('http://ru.server.net/token');

    try {
      await http.post(
        url,
        body: {'token': token},
      );
      // print(res.statusCode);
    } catch (e) {
      // print(e);
    }
  }

  getNews() async {
    Uri url = Uri.parse('https://prinako-ru.cyclic.app/news');
    // Uri url = Uri.parse('http://ru.server.net/api');

    http.Response response = await http.get(
      url,
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      cardapio = json;
      //print(cardapio);
      return news;
    } else {
      // print(response.statusCode);
    }
  }
}
