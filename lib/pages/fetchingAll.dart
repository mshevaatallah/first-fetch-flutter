import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_1/pages/details_pages.dart';
import 'package:project_1/pages/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/http_stateful2.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final String apiUrl = "https://swapi.dev/api/people";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch All'),
        ),
        body: Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              FutureBuilder<List<User>>(
                future: fetchUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<User> users = snapshot.data as List<User>;
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: users.length,

                        // ignore: dead_code
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.all(8),
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Details(user: users[index]),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Text("Name :" + users[index].name),
                                  Text("Gender :" + users[index].gender),
                                  Text("Eye Color :" + users[index].eye_color),
                                ],
                              ),
                            ),

                            // shape: () {
                            //   Navigator.pushNamed(context, '/details',
                            //       arguments: users[index]);
                            // },
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error.toString());
                    return Text('error');
                  }
                  return CircularProgressIndicator();
                },
              ),
              //add text widget here
              Text("Nama")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              setState(() {
                preferences.remove('token');
                preferences.remove('isLogin');
              });

              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text("Logout"),
            backgroundColor: Colors.green));
  }

  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return ((json.decode(response.body)['results'] ?? []) as List)
        .map((e) => User.fromJson(e))
        .toList();
  }
}
