import 'package:flutter/material.dart';
import 'package:module_3/task1_product.dart';

class Task1ProductDetail extends StatelessWidget {
  const Task1ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final product =
    ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${product.name}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Price: ₹${product.price}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
