import 'package:flutter/material.dart';

class Task32 extends StatelessWidget {
  const Task32({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [

            // Main Button
            Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Padding(
                padding:   EdgeInsets.only(top: 20),
                child: Text(
                  "Upload",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Icon Positioned Slightly Above
            Positioned(
              top: -25,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.cloud_upload,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
