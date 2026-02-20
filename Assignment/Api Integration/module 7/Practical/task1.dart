import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  String city = "Rajkot";
  String temperature = "";
  String description = "";
  bool isLoading = false;

  Future<void> fetchWeather() async {
    setState(() {
      isLoading = true;
    });

    final apiKey = "4ad7822624f441912b45924b0298cedc";
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        temperature = data['main']['temp'].toString();
        description = data['weather'][0]['description'];
        isLoading = false;
      });
    } else {
      setState(() {
        temperature = "Error";
        description = "Could not fetch data";
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Weather App"),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              city,
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 10),
            Text(
              "$temperature °C",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text("Refresh"),
            ),
          ],
        ),
      ),
    );
  }
}