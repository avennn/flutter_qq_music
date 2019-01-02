import 'package:flutter/material.dart';
import './carousel.dart' show CarouselComponent;
import './category_card.dart' show CategoryCard;

class CarouselCategoryStack extends StatefulWidget {
  @override
  CarouselCategoryStackState createState() => CarouselCategoryStackState();
}

class CarouselCategoryStackState extends State<CarouselCategoryStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Column(
          children: <Widget>[
            CarouselComponent(),
            Container(
              height: 86.0,
              color: const Color(0xFFFFFFFF),
            )
          ],
        ),
        CategoryCard()
      ],
    );
  }
}