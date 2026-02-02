import 'package:flutter/material.dart';
import 'package:module_3/task2_drawer.dart';

class Task2Profile extends StatelessWidget {
  const Task2Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      drawer: Task2Drawer(),
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
