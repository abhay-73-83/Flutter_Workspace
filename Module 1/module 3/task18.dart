import 'package:flutter/material.dart';

class Task18 extends StatefulWidget {
  const Task18({super.key});

  @override
  State<Task18> createState() => _Task18State();
}

class _Task18State extends State<Task18> {
  String category = "General";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Name"),
            ),

            TextField(
              decoration: InputDecoration(labelText: "Comment"),
            ),

            DropdownButton<String>(
              value: category,
              items: [
                DropdownMenuItem(value: "General", child: Text("General")),
                DropdownMenuItem(value: "Bug", child: Text("Bug")),
                DropdownMenuItem(value: "Suggestion", child: Text("Suggestion")),
              ],
              onChanged: (value) {
                setState(() {
                  category = value!;
                });
              },
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print("Feedback Submitted");
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
