import 'package:flutter/material.dart';

class Task44Screen extends StatelessWidget {
  const Task44Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Center(
        child: Task44(
          imageUrl: "https://i.pravatar.cc/150?img=8",
          isOnline: false,
        ),
      ),
    );
  }
}

class Task44 extends StatelessWidget {
  final String imageUrl;
  final bool? isOnline;
  final double radius;

  const Task44({
    super.key,
    required this.imageUrl,
    this.isOnline,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(imageUrl),
        ),
        if (isOnline != null)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: radius * 0.6,
              height: radius * 0.6,
              decoration: BoxDecoration(
                color: isOnline! ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
