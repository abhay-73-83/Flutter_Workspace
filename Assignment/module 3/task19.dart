import 'package:flutter/material.dart';

class Task19 extends StatefulWidget {
  const Task19({super.key});

  @override
  State<Task19> createState() => _Task19State();
}

class _Task19State extends State<Task19> {
  List<String> names = [
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Grapes",
    "Pineapple",
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    List<String> filteredNames = names
        .where((item) =>
        item.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Search Bar")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: filteredNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredNames[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
