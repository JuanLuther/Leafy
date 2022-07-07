// ignore_for_file: unnecessary_const

import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:leafy/homecomponents/species.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  late String drawerImage = "https://images.dog.ceo/breeds/sharpei/noel.jpg";

  @override
  void initState() {
    super.initState();
    getDog();
  }

  getDog() async {
    var response = await Dio().get("https://dog.ceo/api/breeds/image/random");
    Map resp = response.data;
    setState(() {
      drawerImage = resp.entries.first.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const TabBarView(children: [
          const Species(),
          const Center(child: const Text("Genus")),
          Center(child: const Text("Family")),
        ]),
        appBar: AppBar(
          title: const TabBar(
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
