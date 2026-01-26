import 'package:flutter/material.dart';
import 'package:module_3/task1_home.dart';
import 'package:module_3/task1_product_detail.dart';
import 'package:module_3/task1_product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Screen App',
      initialRoute: '/',
      routes: {
        '/': (context) => Task1Home(),
        '/products': (context) => Task1ProductList(),
        '/details': (context) => Task1ProductDetail(),
      },
    );
  }
}
