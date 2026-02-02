import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VegetablePage extends StatefulWidget {
  const VegetablePage({super.key});

  @override
  State<VegetablePage> createState() => _VegetablePageState();
}

class _VegetablePageState extends State<VegetablePage> {
  final List<String> vegetables = [
    "Carrot",
    "Tomato",
    "Potato",
    "Cabbage",
    "Corn",
  ];

  final List<String> vegetableImages = [
    "assets/carrot.png",
    "assets/tomato.png",
    "assets/potato.png",
    "assets/cabbage.png",
    "assets/corn.png",
  ];

  late SpeechToText speech;
  bool _isListening = false;
  String _spokenText = "";

  @override
  void initState() {
    super.initState();
    speech = SpeechToText();
  }

  void listen() async {
    if (!_isListening) {
      bool available = await speech.initialize(
        onStatus: (val) => print('Status: $val'),
        onError: (val) => print('Error: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        speech.listen(
          onResult: (val) {
            setState(() {
              _spokenText = val.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      speech.stop();
    }
  }

  @override
  void dispose() {
    speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vegetables"),
      ),
      body: Column(
        children: [
          if (_spokenText.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "You said: $_spokenText",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: vegetables.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    vegetableImages[index],
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    vegetables[index],
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_voice, color: Colors.green),
                    onPressed: listen, // start listening when pressed
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("You tapped ${vegetables[index]}"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
