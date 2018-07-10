import 'package:flutter/material.dart';
import '../../../constants/index.dart';

class RecommendHeader extends StatelessWidget {
  final _headerHeight = 50.0;
  String title;
  String toScreen;
  RecommendHeader(this.title, this.toScreen);

  Widget clickableTitle() {
    return new GestureDetector(
      onTap: () {
        print('print tap recommend header title');
      },
      child: new Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: _headerHeight,
        color: Colors.white,
        child: new Center(
          child:  new Text(
            this.title,
            style: new TextStyle(
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
    return new GestureDetector(
      onTap: () {
        print('tap navigate button');
      },
      child: new Container(
        width: 40.0,
        height: _headerHeight,
        color: Colors.white,
        child: new Center(
          child: new Icon(
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
    return new Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        new Container(
          height: _headerHeight,
          child: new Row(
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