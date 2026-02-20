import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  List articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final apiKey = "cd13cadc70854ce7a679ffbe2f7fb067";
    final url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          articles = data['articles'];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Feed')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : articles.isEmpty
          ? Center(child: Text('No articles found'))
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: article['urlToImage'] != null
                  ? Image.network(
                article['urlToImage'],
                width: 80,
                fit: BoxFit.cover,
              )
                  : null,
              title: Text(article['title'] ?? 'No Title'),
              subtitle:
              Text(article['description'] ?? 'No Description'),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}