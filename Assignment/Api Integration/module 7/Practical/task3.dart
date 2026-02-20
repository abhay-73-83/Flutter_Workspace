import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task3 extends StatefulWidget {
  const Task3({super.key});

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? movie;
  bool isLoading = false;

  Future<void> fetchMovie(String title) async {
    setState(() {
      isLoading = true;
      movie = null;
    });

    const apiKey = "44f4b969";
    final url = 'http://www.omdbapi.com/?t=$title&apikey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['Response'] == 'True') {
          setState(() {
            movie = data;
            isLoading = false;
          });
        } else {
          setState(() {
            movie = null;
            isLoading = false;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Movie not found')));
        }
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Search')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter movie title',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    final title = _controller.text.trim();
                    if (title.isNotEmpty) fetchMovie(title);
                  },
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) fetchMovie(value);
              },
            ),

            SizedBox(height: 20),

            if (isLoading)
              CircularProgressIndicator()
            else if (movie != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (movie!['Poster'] != null &&
                          movie!['Poster'] != 'N/A')
                        Image.network(movie!['Poster']),

                      SizedBox(height: 10),
                      Text(
                        movie!['Title'] ?? '',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text('Year: ${movie!['Year'] ?? 'N/A'}'),
                      Text('Genre: ${movie!['Genre'] ?? 'N/A'}'),
                      Text('Director: ${movie!['Director'] ?? 'N/A'}'),
                      SizedBox(height: 10),
                      Text(movie!['Plot'] ?? ''),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
