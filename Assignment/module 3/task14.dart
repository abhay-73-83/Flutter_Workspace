import 'package:flutter/material.dart';

class Task14 extends StatelessWidget {
  const Task14({super.key});

  final List<String> images = const [
    "https://m.media-amazon.com/images/I/81EhZofH2RL._AC_UF1000,1000_QL80_.jpg",
    "https://img.freepik.com/premium-photo/colorful-background-leaves-with-different-colors-purple-blue-pink_875825-178598.jpg?semt=ais_hybrid&w=740&q=80",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHGPN6c85owGof2YMWIJCtRH-eV0IJPyjZyg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJt4Ixj4u0hVZpnY5KJWFan2xzN9SAOg2ksw&s",
    "https://5.imimg.com/data5/AH/UJ/MY-3979298/premium-hd-wallpaper-500x500.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4jO36Etjr0T_NYdjf8hzZ1kBQ9VEjDGo8rw&s"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo Gallery")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
