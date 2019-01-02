import 'package:flutter/material.dart';
import '../../../constants/index.dart';

class RecommendHeader extends StatelessWidget {
  final _headerHeight = 50.0;
  String title;
  String toScreen;
  RecommendHeader(this.title, this.toScreen);

  Widget clickableTitle() {
    return GestureDetector(
      onTap: () {
        print('print tap recommend header title');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: _headerHeight,
        color: Colors.white,
        child: Center(
          child:  Text(
            this.title,
            style: TextStyle(
              color: Constants.defaultFontColor,
              fontSize: 18.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }

  Widget navigateButton() {
    return GestureDetector(
      onTap: () {
        print('tap navigate button');
      },
      child: Container(
        width: 40.0,
        height: _headerHeight,
        color: Colors.white,
        child: Center(
          child: Icon(
            Icons.chevron_right,
            size: 28.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        Container(
          height: _headerHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              clickableTitle()
            ],
          ),
        ),
        navigateButton()
      ],
    );
  }
}