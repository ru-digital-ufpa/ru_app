//import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  List<dynamic> cardapio = [];
  NetworkHelper();
  Future getData() async {
    http.Response response = await http.get(
      Uri.parse('https://prinako-ru.cyclic.app/api'),
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      cardapio = json;
      //print(cardapio);
      return cardapio;
    } else {
      print(response.statusCode);
    }
  }
}
