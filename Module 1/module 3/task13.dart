import 'package:flutter/material.dart';

class Task13 extends StatefulWidget {
  const Task13({super.key});

  @override
  State<Task13> createState() => _Task13State();
}

class _Task13State extends State<Task13> {
  String imageUrl =
      "https://images.pexels.com/photos/734428/pexels-photo-734428.jpeg?cs=srgb&dl=pexels-rbrigant44-734428.jpg&fm=jpg";

  void changeImage() {
    setState(() {
      imageUrl = "https://media.istockphoto.com/id/961805314/photo/a-new-beginning-into-a-sunny-future.jpg?s=612x612&w=0&k=20&c=MW2AooakMyPMJGVAgaIrM9TZlBwRYuN0rTXKgTPYnbM=";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Change App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeImage,
              child: Text("Change Image"),
            ),
          ],
        ),
      ),
    );
  }
}
