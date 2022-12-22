import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_1/models/http_stateful.dart';

class Fetch extends StatefulWidget {
  const Fetch({Key? key}) : super(key: key);

  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  HttpStateful dataResponse = HttpStateful(name: '', height: '', mass: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch API Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: unnecessary_null_comparison
            Text((dataResponse.name == false)
                ? "Name : Belum ada data"
                : 'Name: ${dataResponse.name}'),
            // ignore: unrelated_type_equality_checks
            Text((dataResponse.height == false)
                ? "Height: Belum ada data "
                : 'Height: ${dataResponse.height}'),
            Text('Mass: ${dataResponse.mass}'),
            OutlinedButton(
              onPressed: () {
                HttpStateful.connectAPI((1 + Random().nextInt(10)).toString())
                    .then((value) => setState(() {
                          dataResponse = value;
                        }));
              },
              child: Text('Fetch API'),
            ),
          ],
        ),
      ),
    );
  }
}
