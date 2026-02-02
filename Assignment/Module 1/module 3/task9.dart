import 'package:flutter/material.dart';

class Task9 extends StatelessWidget {
  const Task9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        children: [
          Container(
            height: 360,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(20),
            child: Text("0", style: TextStyle(fontSize: 32)),
          ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn("+"),
                btn("4"),
                btn("5"),
                btn("6"),
                btn("-"),
                btn("1"),
                btn("2"),
                btn("3"),
                btn("*"),
                btn("C"),
                btn("0"),
                btn("="),
                btn("/"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget btn(String text) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }
}
