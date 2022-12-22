import 'dart:convert';

import 'package:http/http.dart' as http;

class PeopleServices {
  static Future<List<dynamic>> getPeople() async {
    var url = Uri.parse('https://swapi.dev/api/people');
    var response = await http.get(url);
    var data = json.decode(response.body);
    return data['results'];
  }
}
