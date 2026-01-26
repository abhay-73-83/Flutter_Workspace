import 'package:flutter/material.dart';

class Task5 extends StatelessWidget {
  const Task5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Layout'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}