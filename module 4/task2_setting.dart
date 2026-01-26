import 'package:flutter/material.dart';
import 'package:module_3/task2_drawer.dart';

class Task2Setting extends StatelessWidget {
  const Task2Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      drawer: Task2Drawer(),
      body: Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
