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
    if (res.statusCode == 200) {
      print("correct");
      var response = json.decode(res.body);
      String token = (response["token"]);

      final localstorage = await SharedPreferences.getInstance();
      localstorage.setString("token", token);
    } else {
      AlertDialog(
        title: const Text('ERROR'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {},
          ),
        ],
      );
    }

    //   var res = await http.post(url, body: {
    //     username: username,
    //     password: password,
    //   }

    //   ).then((value) => print(value.body));
  }
}
