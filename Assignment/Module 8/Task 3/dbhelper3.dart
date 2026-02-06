import 'package:shared_preferences/shared_preferences.dart';

class DBHelper
{
  static const String _notesKey = 'notes';

  static Future<List<String>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_notesKey) ?? [];
  }

  static Future<void> saveNotes(List<String> notes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_notesKey, notes);
  }
}