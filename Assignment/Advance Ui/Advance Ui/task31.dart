import 'package:flutter/material.dart';

class Task31 extends StatelessWidget {
  const Task31({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card with FAB")),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            // Card
            Container(
              width: 320,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Card",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This is a simple card UI built using Stack and Positioned. "
                        "The floating action button is placed at the bottom right.",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 40), // space for FAB overlap
                ],
              ),
            ),

            // Floating Action Button Positioned
            Positioned(
              bottom: -25,
              right: -25,
              child: FloatingActionButton(
                onPressed: () {
                  print("FAB Pressed");
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
