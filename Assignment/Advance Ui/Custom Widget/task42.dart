import 'package:flutter/material.dart';

class Task42 extends StatelessWidget {
  final double percentage;// value from 0 to 100

  const Task42({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (percentage.clamp(0, 100)) / 100;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${percentage.toInt()}%"),

          SizedBox(height: 8),

          Container(
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}