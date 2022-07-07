import 'package:flutter/material.dart';
import 'package:leafy/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final Color defaultColor = const Color.fromRGBO(58, 66, 86, 1.0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leafy',
      theme: ThemeData(
        primaryColor: defaultColor,
      ),
      home: const MyHomePage(
        title: 'Leafy',
      ),
    );
  }
}
