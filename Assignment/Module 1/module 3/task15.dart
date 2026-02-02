import 'package:flutter/material.dart';

class Task15 extends StatefulWidget
{
  const Task15({super.key});

  @override
  State<Task15> createState() => _Task15State();
}

class _Task15State extends State<Task15> {
  BoxFit fit = BoxFit.cover;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image & BoxFit")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[300],
            child: Image.asset(
              "assets/photo1.jpg",
              fit: fit,
            ),
          ),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                fit = BoxFit.cover;
              });
            },
            child: Text("Cover"),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                fit = BoxFit.contain;
              });
            },
            child: Text("Contain"),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                fit = BoxFit.fill;
              });
            },
            child: Text("Fill"),
          ),
        ],
      ),
    );
  }
}
