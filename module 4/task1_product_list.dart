import 'package:flutter/material.dart';
import 'package:module_3/task1_product.dart';

class Task1ProductList extends StatelessWidget {
  Task1ProductList({super.key});

  final List<Product> products = [
    Product(id: 1, name: 'Laptop', price: 1200),
    Product(id: 2, name: 'Phone', price: 800),
    Product(id: 3, name: 'Headphones', price: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('₹${products[index].price}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: products[index],
              );
            },
          );
        },
      ),
    );
  }
}
