import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String name;
  String gender;
  String eye_color;
  String height;
  String birth_year;

  User(
      {required this.name,
      required this.gender,
      required this.eye_color,
      required this.height,
      required this.birth_year});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      gender: json['gender'],
      eye_color: json['eye_color'],
      height: json['height'],
      birth_year: json['birth_year'],
    );
  }
  // Future<List<User>> fetchUsers() async {
  //   var response = await http.get(Uri.parse("https://swapi.dev/api/people"));
  //   return (json.decode(response.body)['data'] as List)
  //       .map((e) => User.fromJson(e))
  //       .toList();
  // }
}
