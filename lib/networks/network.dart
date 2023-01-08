//import 'dart:html';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper();
  Future getData() async {
    http.Response response =
        await http.get(Uri.parse('https://prinako-ru.cyclic.app/api'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
