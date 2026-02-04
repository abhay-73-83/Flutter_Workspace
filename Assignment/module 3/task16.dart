import 'dart:async';
import 'package:flutter/material.dart';

class Task16 extends StatefulWidget {
  const Task16({super.key});

  @override
  State<Task16> createState() => _Task16State();
}

class _Task16State extends State<Task16> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<String> images = [
    "https://static.vecteezy.com/system/resources/thumbnails/049/855/471/small/nature-background-high-resolution-wallpaper-for-a-serene-and-stunning-view-free-photo.jpg",
    "https://m.media-amazon.com/images/I/61qbMx4oXJL._AC_UF1000,1000_QL80_.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvC87XGsqArrLQ2XKc3Ib2Jo_fKnNJzHK14g&s",
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      currentPage = (currentPage + 1) % images.length;

      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Carousel")),
      body: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(
            images[index],
          );
        },
      ),
    );
  }
}
