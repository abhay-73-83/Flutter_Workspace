import 'package:flutter/material.dart';

class Task12 extends StatefulWidget {
  const Task12({super.key});

  @override
  State<Task12> createState() => _Task12State();
}

class _Task12State extends State<Task12> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isOn ? Colors.green[200] : Colors.white,
      appBar: AppBar(title: Text("Toggle Switch")),
      body: Center(
        child: Switch(
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = value;
            });
          },
        ),
      ),
    );
  }
}
