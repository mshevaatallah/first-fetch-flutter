import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  login(String username, String password) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    var res = await http.post(url, body: {
      'username': username,
      'password': password,
    });
  }
}
