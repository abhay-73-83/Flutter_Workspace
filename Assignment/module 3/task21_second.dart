import 'package:flutter/material.dart';

class Task21Second extends StatelessWidget {
  const Task21Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: const Center(
        child: Text(
          "Welcome to the Second Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
