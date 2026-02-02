import 'package:flutter/material.dart';

class Task7 extends StatelessWidget {
  const Task7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Grid')),
      body: GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          Image(
            image: NetworkImage(
              'https://img.freepik.com/premium-photo/morning-serenity-dewkissed-moss-sprouts-soft-natural-light_1067911-7823.jpg?semt=ais_hybrid&w=740&q=80',
            ),
          ),
          Image(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRabewLS6hHCS8S_zpU49M6ttW0kq7dKmdEpA&s',
            ),
          ),
          Image(
            image: NetworkImage(
              'https://rukminim2.flixcart.com/image/480/480/jjbqufk0/poster/t/v/x/large-vlnature00093a-natural-scene-of-beautiful-bird-vinyl-original-imaeh9vdy7kzxzdy.jpeg?q=90',
            ),
          ),
          Image(
            image: NetworkImage(
              'https://img.freepik.com/free-photo/closeup-dried-out-yosemite-waterfall-yosemite-national-park_181624-37045.jpg?semt=ais_hybrid&w=740&q=80',
            ),
          ),
          Image(
            image: NetworkImage(
              'https://previews.123rf.com/images/carballo/carballo1306/carballo130600042/20304502-natural-flower-with-stones-and-water.jpg',
            ),
          ),
          Image(
            image: NetworkImage(
              'https://wallpapers.com/images/hd/natural-pictures-5vom1y4g9va1uvn8.jpg',
            ),
          ),
          Image(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmMk-Q1AEm3RvibWjXFn7ODY5DFEraeSi31A&s',
            ),
          ),
          Image(
            image: NetworkImage(
              'https://res.cloudinary.com/jerrick/image/upload/d_642250b563292b35f27461a7.png,f_jpg,fl_progressive,q_auto,w_1024/65d9da7900c5b5001dd85b7a.jpg',
            ),
          ),
        ],
      ),
    );
  }
}