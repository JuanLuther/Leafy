import 'package:flutter/material.dart';

class Species extends StatelessWidget {
  const Species({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero",
      child: Scaffold(
        body: InkWell(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const MyWidget()))),
          child: Card(
            child: ListTile(
              autofocus: true,
              leading: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.network(
                  "https://images.dog.ceo/breeds/sharpei/noel.jpg",
                  height: 100,
                ),
              ),
              title: const Text("A dog"),
              trailing: const Icon(Icons.place),
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero",
      child: Scaffold(
        appBar: AppBar(),
        body: Image.network(
          "https://images.dog.ceo/breeds/sharpei/noel.jpg",
        ),
      ),
    );
  }
}
