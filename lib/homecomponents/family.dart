import 'package:flutter/material.dart';

class Family extends StatefulWidget {
  const Family({Key? key}) : super(key: key);

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Card(
          child: ListTile(
            title: Text("Family"),
            leading: Text("1"),
          ),
        )
      ],
    );
  }
}
