import 'package:flutter/material.dart';
import 'package:module_3/task2_drawer.dart';

class Task2Home extends StatelessWidget {
  const Task2Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Task2Drawer(),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
