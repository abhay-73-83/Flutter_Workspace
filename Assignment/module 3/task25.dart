import 'package:flutter/material.dart';

class Task25 extends StatefulWidget {
  @override
  State<Task25> createState() => _Task25State();
}

class _Task25State extends State<Task25> {
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void addTask() {
    if (taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do List")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      labelText: "Enter Task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addTask,
                  child: Text("Add"),
                ),
              ],
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(tasks[index]),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      removeTask(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Task removed")),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(left: 16),
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete, color: Colors.black),
                    ),
                    child: ListTile(
                      title: Text(tasks[index]),
                    ),
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
