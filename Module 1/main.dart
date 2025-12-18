import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Personalized Hello World',
      home: Scaffold(
        // Set background color
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
          title: Text('Welcome'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Text(
            'Hello, Abhay',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.deepPurple,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }
}
