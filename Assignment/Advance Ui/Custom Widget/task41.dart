import 'package:flutter/material.dart';

class Task41 extends StatefulWidget {
  const Task41({super.key});

  @override
  State<Task41> createState() => _Task41State();
}

class _Task41State extends State<Task41> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              // If clicking the same rating, reset to 0
              if (rating == index + 1) {
                rating = 0;
              } else {
                rating = index + 1;
              }
            });
          },
        );
      }),
    );
  }
}
