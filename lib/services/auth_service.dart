import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  login(String username, String password) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }));
    if (res.statusCode == 200) {
      print("correct");
      print(res.body);
    } else {
      print("password salah");
    }

    //   var res = await http.post(url, body: {
    //     username: username,
    //     password: password,
    //   }

    //   ).then((value) => print(value.body));
  }
}
