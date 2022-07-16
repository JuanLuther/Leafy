import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Plant extends StatefulWidget {
  const Plant({Key? key}) : super(key: key);
  @override
  State<Plant> createState() => _PlantState();
}

class _PlantState extends State<Plant> {
  Future getResponse() async {
    var response =
        await http.get(Uri.https('juanl.pythonanywhere.com', 'plants'));
    var jsonData = jsonDecode(response.body)['plants'];
    List<PlantPOJO> plants = [];
    for (var p in jsonData) {
      var plantPOJO = PlantPOJO(
        p['1_id'].toString(),
        p['2_specie'],
        p['3_genus'],
        p['4_family'],
        p['5_images'].toString(),
      );
      plants.add(plantPOJO);
    }
    return plants;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getResponse(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var data = snapshot.data as List<PlantPOJO>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(data[index].specie),
                subtitle: Text("${data[index].family}, ${data[index].genus}"),
                leading: Text(data[index].id),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        }
      },
    );
  }
}

class PlantPOJO {
  final String id, images, specie, genus, family;
  PlantPOJO(
    this.id,
    this.specie,
    this.genus,
    this.family,
    this.images,
  );
}
