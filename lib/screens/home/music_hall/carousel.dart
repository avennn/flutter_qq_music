import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';

class CarouselComponent extends StatefulWidget {
  @override
  CarouselComponentState createState() => CarouselComponentState();
}

class CarouselComponentState extends State<CarouselComponent> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1080 / 432,
      child: Carousel(
        children: [
          AssetImage(
            'assets/images/home/carsouel1.jpg'
          ),
          AssetImage(
            'assets/images/home/carsouel2.jpg'
          ),
          AssetImage(
            'assets/images/home/carsouel3.jpg'
          ),
          AssetImage(
            'assets/images/home/carsouel4.jpg'
          ),
          AssetImage(
            'assets/images/home/carsouel5.jpg'
          )
        ].map((netImage) => Image(image: netImage, fit: BoxFit.cover)).toList(),
        displayDuration: const Duration(seconds: 3)
      ),
    );
  }
}