import 'package:flutter/material.dart';
import 'package:leafy/views/classifier.dart';
import 'package:leafy/views/library.dart';
import 'package:leafy/views/sampleclassifier.dart';

import 'homecomponents/drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  List<Widget> views = const [
    Library(),
    // Classifier(),
    Sample()
  ];
  String drawerImage = "https://images.dog.ceo/breeds/sharpei/noel.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TheDrawer(),
      body: Center(child: views[currentIndex]),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (value) => {
        setState(() => currentIndex = value),
      },
      items: const [
        BottomNavigationBarItem(
          label: "Library",
          icon: Icon(Icons.list_rounded),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image_search_rounded),
          label: "Classify",
        ),
      ],
    );
  }
}
