import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_1/pages/details_pages.dart';
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
          child: FutureBuilder<List<User>>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> users = snapshot.data as List<User>;
                return ListView.builder(
                    itemCount: users.length,
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
                          )
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
        ));
  }

  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse(apiUrl));
    return ((json.decode(response.body)['results'] ?? []) as List)
        .map((e) => User.fromJson(e))
        .toList();
  }
}
