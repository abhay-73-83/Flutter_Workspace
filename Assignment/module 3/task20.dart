import 'package:flutter/material.dart';

class Task20 extends StatefulWidget {
  const Task20({super.key});

  @override
  State<Task20> createState() => _Task20State();
}

class _Task20State extends State<Task20> {
  List<String> tasks = [];
  List<bool> completed = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    setState(() {
      tasks.add(taskController.text);
      completed.add(false);
      taskController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: addTask,
              child: Text("Add Task"),
            ),
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(tasks[index]),
                    value: completed[index],
                    onChanged: (value) {
                      setState(() {
                        completed[index] = value!;
                      });
                    },
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