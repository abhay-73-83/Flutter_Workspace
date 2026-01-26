import 'package:flutter/material.dart';

class Task27 extends StatefulWidget {
  const Task27({super.key});

  @override
  State<Task27> createState() => _Task27State();
}

class _Task27State extends State<Task27> {
  List<String> items = [
    'Profile',
    'Settings',
    'Notifications',
    'Help',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom ListTile'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.list, color: Colors.blue),
              ),
              title: Text(
                items[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Tap to view details'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    items.removeAt(index);
                  });
                },
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${items[index]} clicked'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
