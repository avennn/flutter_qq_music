import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';

class CarouselComponent extends StatefulWidget {
  @override
  CarouselComponentState createState() => new CarouselComponentState();
}

class CarouselComponentState extends State<CarouselComponent> {
  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 1080 / 432,
      child: new Carousel(
        children: [
          new AssetImage(
            'assets/images/home/carsouel1.jpg'
          ),
          new AssetImage(
            'assets/images/home/carsouel2.jpg'
          ),
          new AssetImage(
            'assets/images/home/carsouel3.jpg'
          ),
          new AssetImage(
            'assets/images/home/carsouel4.jpg'
          ),
          new AssetImage(
            'assets/images/home/carsouel5.jpg'
          )
        ].map((netImage) => new Image(image: netImage, fit: BoxFit.cover)).toList(),
        displayDuration: const Duration(seconds: 3)
      ),
    );
  }
}