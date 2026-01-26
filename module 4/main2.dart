import 'package:flutter/material.dart';
import 'package:module_3/task2_home.dart';
import 'package:module_3/task2_profile.dart';
import 'package:module_3/task2_setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer App',
      initialRoute: '/',
      routes: {
        '/': (context) => Task2Home(),
        '/profile': (context) => Task2Profile(),
        '/settings': (context) => Task2Setting(),
      },
    );
  }
}
