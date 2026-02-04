import 'package:flutter/material.dart';
import 'package:module_3/task22_settings.dart';

class Task22Detailed extends StatelessWidget {
  final String message;

  const Task22Detailed({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Go to Settings"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Task22Settings()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
