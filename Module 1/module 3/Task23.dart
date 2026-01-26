import 'package:flutter/material.dart';
import 'package:module_3/Task23_home.dart';
import 'package:module_3/task23_profile.dart';
import 'package:module_3/task23_settings.dart';

class Task23 extends StatefulWidget {
  const Task23({super.key});

  @override
  State<Task23> createState() => _Task23State();
}

class _Task23State extends State<Task23> {
  int selectedIndex = 0;

  final screens = [
    Task23Home(),
    Task23Profile(),
    Task23Settings(),
  ];

  final titles = [
    "Home",
    "Profile",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex])),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Navigation Drawer",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
