import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_1/models/http_stateful2.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Name :" + user.name),
            Text("Eye Color :" + user.eye_color),
            Text("Gender :" + user.gender),
            Text("height :" + user.height),
            Text("Birth Year :" + user.birth_year),
          ],
        ),
      ),
    );
  }
}
