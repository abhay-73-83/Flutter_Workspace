import 'package:flutter/material.dart';


class Task24 extends StatefulWidget {
  const Task24({super.key});

  @override
  State<Task24> createState() => _Task24State();
}

class _Task24State extends State<Task24> {
  int selectedIndex = 0;

  final titles = ["News", "Messages", "Profile"];

  final screens = [
    Center(child: Text("News Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Messages Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex])),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
