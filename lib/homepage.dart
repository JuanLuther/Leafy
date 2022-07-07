import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:leafy/views/classifier.dart';
import 'package:leafy/views/library.dart';

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
    Classifier(),
  ];
  String drawerImage = "https://images.dog.ceo/breeds/sharpei/noel.jpg";

  @override
  void initState() {
    super.initState();
    // getDog();
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
    return Scaffold(
      drawer: drawer(),
      appBar: appBar(),
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
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Library"),
        BottomNavigationBarItem(
            icon: Icon(Icons.image_search), label: "Classify"),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0.1,
      title: Text(widget.title),
      actions: const [Icon(Icons.search)],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      backgroundImage: NetworkImage(drawerImage),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Luther Hernando",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Column(
            children: [
              listTile(icon: Icons.person, title: "Profile"),
              listTile(icon: Icons.settings, title: "Settings"),
              listTile(icon: Icons.notifications, title: "Notifications"),
              listTile(icon: Icons.help, title: "Help"),
              listTile(icon: Icons.info, title: "About Us"),
              listTile(icon: Icons.logout, title: "Log Out"),
            ],
          ),
        ],
      ),
    );
  }

  Widget listTile({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
