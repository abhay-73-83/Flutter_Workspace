import 'package:flutter/material.dart';
import 'package:module_3/task21_second.dart';

class Task21 extends StatelessWidget {
  const Task21({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Second Screen"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Task21Second()),
            );
          },
        ),
      ),
    );
  }
}