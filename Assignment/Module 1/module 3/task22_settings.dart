import 'package:flutter/material.dart';

class Task22Settings extends StatelessWidget {
  const Task22Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(
        child: Text(
          "Settings Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
