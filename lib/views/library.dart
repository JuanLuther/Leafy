import "package:flutter/material.dart";
import 'package:leafy/homecomponents/drawer.dart';
import 'package:leafy/homecomponents/family.dart';
import 'package:leafy/homecomponents/genus.dart';
import 'package:leafy/homecomponents/plant.dart';
import 'package:leafy/homecomponents/species.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  late String drawerImage = "https://images.dog.ceo/breeds/sharpei/noel.jpg";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const TheDrawer(),
        body: const TabBarView(children: [
          Plant(),
          Genus(),
          Family(),
        ]),
        appBar: AppBar(
          title: const Text("Plant Library"),
          bottom: const TabBar(
            // indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "SPECIE",
              ),
              Tab(
                text: "GENUS",
              ),
              Tab(
                text: "FAMILY",
              )
            ],
          ),
        ),
      ),
    );
  }
}
