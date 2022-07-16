import 'package:flutter/material.dart';

class Genus extends StatefulWidget {
  const Genus({Key? key}) : super(key: key);

  @override
  State<Genus> createState() => _GenusState();
}

class _GenusState extends State<Genus> {
  var genuses = [
    {"name": "plant", "genus": "genus1", "family": "family1"},
    {"name": "plant1", "genus": "genus1", "family": "family"},
    {"name": "plant", "genus": "genus2", "family": "family1"},
    {"name": "plant1", "genus": "genus2", "family": "family"},
  ];
  @override
  Widget build(BuildContext context) {
    // get all instance of genuses where genus == genus1
    // list of all genus== genus1
    var listGenus1 = [];
    // create for loop for genuses
    for (var element in genuses) {
      if (element["genus"] == "genus1") {
        // add the map element that satisfy the condition
        listGenus1.add(element);
      }
    }
    return ListView.builder(
      itemCount: listGenus1.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(listGenus1[index]["name"]!),
          leading: Text(listGenus1[index]["family"]),
        ),
      ),
    );
  }
}
