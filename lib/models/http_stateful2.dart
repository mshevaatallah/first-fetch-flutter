import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String name;
  String gender;

  User({required this.name, required this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      gender: json['gender'],
    );
  }
  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse("https://swapi.dev/api/people"));
    return (json.decode(response.body)['data'] as List)
        .map((e) => User.fromJson(e))
        .toList();
  }
}
