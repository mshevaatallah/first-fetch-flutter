import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_1/models/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  login(String username, String password) async {
    Uri url = Uri.parse('https://dummyjson.com/auth/login');
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }));
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200) {
      final localstorage = await SharedPreferences.getInstance();
      var response = json.decode(res.body);

      String token = (response["token"]);
      localstorage.setString("token", token);
      return true;

      // localstorage.setBool("isLogin", true);
      // print("correct");
      // var response = json.decode(res.body);

      // String token = (response["token"]);

    } else {
      return false;
      // final localstorage = await SharedPreferences.getInstance();
      // localstorage.setBool("isLogin", false);
    }

    //   var res = await http.post(url, body: {
    //     username: username,
    //     password: password,
    //   }

    //   ).then((value) => print(value.body));
  }
}
