import 'package:flutter/material.dart';
import './carousel.dart' show CarouselComponent;
import './category_card.dart' show CategoryCard;

class CarouselCategoryStack extends StatefulWidget {
  @override
  CarouselCategoryStackState createState() => new CarouselCategoryStackState();
}

class CarouselCategoryStackState extends State<CarouselCategoryStack> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new CarouselComponent(),
            new Container(
              height: 86.0,
              color: const Color(0xFFFFFFFF),
            )
          ],
        ),
        new CategoryCard()
      ],
    );
  }
}