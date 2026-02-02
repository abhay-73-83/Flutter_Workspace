import 'package:flutter/material.dart';

class Task1Home extends StatelessWidget {
  const Task1Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: Text('View Products'),
          onPressed: ()
          {
            Navigator.pushNamed(context, '/products');
          },
        ),
      ),
    );
  }
}
