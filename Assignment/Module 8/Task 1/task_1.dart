import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  final TextEditingController _nameController = TextEditingController();
  bool _isDarkMode = false;
  String _savedName = '';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('username') ?? '';
      _isDarkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  // Save preferences
  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _nameController.text);
    await prefs.setBool('darkMode', _isDarkMode);

    setState(() {
      _savedName = _nameController.text;
      _nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: Text('User Preferences', style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),),
        backgroundColor: _isDarkMode ? Colors.black : Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved Username: $_savedName',
              style: TextStyle(
                fontSize: 18,
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter username',
                labelStyle: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Dark Mode', style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),),
              value: _isDarkMode,
              onChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _savePreferences,
                child: Text('Save Preferences'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
