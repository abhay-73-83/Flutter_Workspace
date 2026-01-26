import 'package:flutter/material.dart';
import 'package:module_3/task22_detailed.dart';

class Task22Home extends StatelessWidget {
  const Task22Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Details"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Task22Detailed(message: "Hello from Home!"),
              ),
            );
          },
        ),
      ),
    );
  }
}
