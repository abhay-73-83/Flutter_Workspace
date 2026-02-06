import 'package:flutter/material.dart';
import 'dbhelper3.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final TextEditingController _controller = TextEditingController();
  List<String> _notes = [];

  @override
  void initState() {
    _loadNotes();
    super.initState();
  }

  Future<void> _loadNotes() async {
    final notes = await DBHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  void _addNote() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _notes.add(text);
    });

    _controller.clear();
    DBHelper.saveNotes(_notes);
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
    DBHelper.saveNotes(_notes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter a note',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addNote,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteNote(index),
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