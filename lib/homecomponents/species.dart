import 'package:flutter/material.dart';

class Species extends StatelessWidget {
  const Species({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero",
      child: Scaffold(
        body: ListView(children: [
          listElement(context, title: "title", subtitle: "subtitle"),
          listElement(context, title: "title1", subtitle: "subtitle1"),
        ]),
      ),
    );
  }

  InkWell listElement(BuildContext context,
      {required String subtitle, required String title}) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => MyWidget(title: title, subtitle: subtitle)))),
      child: Card(
        child: ListTile(
          autofocus: true,
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.network(
              "https://images.dog.ceo/breeds/sharpei/noel.jpg",
            ),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.place),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero",
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: [
            Image.network("https://images.dog.ceo/breeds/sharpei/noel.jpg"),
            Center(child: Text(title)),
            Center(child: Text(subtitle))
          ],
        ),
      ),
    );
  }
}
