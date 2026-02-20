import 'package:flutter/material.dart';

class Task29 extends StatelessWidget {
  const Task29({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Overlay Example")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            // Semi-transparent overlay
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            // Text on top
            Text(
              "Beautiful Nature",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
