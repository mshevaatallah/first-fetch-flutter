import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  late String name, height, mass;
  HttpStateful({required this.name, required this.height, required this.mass});

  // ignore: non_constant_identifier_names
  static Future<HttpStateful> connectAPI(String id) async {
    Uri url = Uri.parse("https://swapi.dev/api/people/$id");
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);
    print(jsonObject);
    return HttpStateful(
        name: jsonObject['name'],
        height: jsonObject['height'],
        mass: jsonObject['mass']);
  }
}
