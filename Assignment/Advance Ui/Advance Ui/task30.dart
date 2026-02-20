import 'package:flutter/material.dart';

class Task30 extends StatelessWidget {
  const Task30({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Background header
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.blue,
          ),

          // Centered Profile Image using Positioned
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                ),
              ),
            ),
          ),

          // Profile Details Section
          Positioned.fill(
            top: 250,
            child: Column(
              children: [

                SizedBox(height: 70), // space below avatar

                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 8),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Flutter Developer | UI/UX Enthusiast | Tech Blogger",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Example extra info
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 18),
                    SizedBox(width: 4),
                    Text("San Francisco, CA"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
