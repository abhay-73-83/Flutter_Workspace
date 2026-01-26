import 'package:flutter/material.dart';

class Task8 extends StatelessWidget {
  Task8({super.key});

  final List<String> names = [
    'Abhay',
    'Harsh',
    'Himanshu',
    'ved',
    'Sweta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Names List'),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              print('Name tapped');
            },
          );
        },
      ),
    );
  }
}
