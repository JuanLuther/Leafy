import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leafy/login.dart';
import 'package:leafy/singleton.dart';

class TheDrawer extends StatefulWidget {
  const TheDrawer({Key? key}) : super(key: key);

  @override
  State<TheDrawer> createState() => _TheDrawerState();
}

class _TheDrawerState extends State<TheDrawer> {
  final String drawerImage = "https://images.dog.ceo/breeds/sharpei/noel.jpg";

  Singleton _singleton = Singleton();

  @override
  Widget build(BuildContext context) {
    return drawer();
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
              // listTile(icon: Icons.settings, title: "Settings"),
              // listTile(icon: Icons.notifications, title: "Notifications"),
              // listTile(icon: Icons.help, title: "Help"),
              listTile(icon: Icons.info, title: "About Us"),
              listTile(icon: Icons.logout, title: "Log Out"),
              SwitchListTile(
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text("Dark Mode"),
                  value: _singleton.isDarkMode,
                  onChanged: (value) => {
                        setState(() {
                          _singleton.isDarkMode = value;
                        }),
                        if (_singleton.isDarkMode)
                          Get.changeTheme(ThemeData.dark())
                        else
                          Get.changeTheme(ThemeData.light())
                      }),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const Login()))),
                child: const Card(child: ListTile(title: Text("Logout"))),
              )
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
