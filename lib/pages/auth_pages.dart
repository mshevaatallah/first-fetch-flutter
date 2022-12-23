import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_1/pages/fetchingAll.dart';
import 'package:project_1/pages/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPages extends StatefulWidget {
  const AuthPages({Key? key}) : super(key: key);

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  var tokenn = null;
  var isLogin = false;
  getToken() async {
    final localstorage = await SharedPreferences.getInstance();

    var token = localstorage.getString("token");
    var isLogin = localstorage.getBool("isLogin");
    tokenn = token.toString();
    print(token);
    print(isLogin);
  }

  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    if (tokenn != null) {
      return FirstScreen();
    } else {
      return Login();
    }
  }
}
