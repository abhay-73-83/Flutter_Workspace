import 'package:flutter/material.dart';
import 'dbhelper.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final data = await DBHelper.instance.getTasks();
    setState(() {
      _tasks = data;
    });
  }

  Future<void> _addTask() async {
    if (_controller.text.isEmpty) return;
    await DBHelper.instance.insertTask(_controller.text);
    _controller.clear();
    _loadTasks();
  }

  Future<void> _updateTask(int id) async {
    if (_controller.text.isEmpty) return;
    await DBHelper.instance.updateTask(id, _controller.text);
    _controller.clear();
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    await DBHelper.instance.deleteTask(id);
    _loadTasks();
  }

  void _showEditDialog(int id, String title) {
    _controller.text = title;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Update Task'),
        content: TextField(controller: _controller),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _controller.clear();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _updateTask(id);
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(task['title']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () =>
                            _showEditDialog(task['id'], task['title']),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTask(task['id']),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
