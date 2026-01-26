import 'package:flutter/material.dart';

class Task10 extends StatefulWidget {
  const Task10({super.key});

  @override
  State<Task10> createState() => _Task10State();
}

class _Task10State extends State<Task10> {
  int cartCount = 0;

  List<String> items = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        actions: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                "Cart: $cartCount",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  cartCount++;
                });
              },
              child: Text("Add to Cart"),
            ),
          );
        },
      ),
    );
  }
}
