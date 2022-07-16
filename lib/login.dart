import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // Navigator.pop(context);
    return Scaffold(
        appBar: AppBar(),
        body: WillPopScope(
            onWillPop: () async {
              // SystemNavigator.pop();
              return false;
            },
            child: const Center(child: Text("this is a login page"))));
  }
}
