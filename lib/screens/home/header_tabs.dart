import 'package:flutter/material.dart';
import '../../constants/index.dart';

class HeaderTabs extends StatefulWidget {
  @override
  HeaderTabsState createState() => new HeaderTabsState();
}

class HeaderTabsState extends State<HeaderTabs> {
  Widget myTabButton() {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
        height: 44.0,
        child: new Text(
          '我的',
          style: new TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w100,
            color: const Color.fromRGBO(255, 255, 255, 0.9)
          ),
        ),
      ),
      onTap: () {
        print('tap my');
      }
    );
  }

  Widget musicHallTabButton() {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
        height: 44.0,
        child: Text(
          '音乐馆',
          style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFFFFF)
          )
        )
      ),
      onTap: () {
        print('tap music hall');
      }
    );
  }

  Widget findTabButton() {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
        height: 44.0,
        child: new Text(
          '发现',
          style: new TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w100,
            color: const Color.fromRGBO(255, 255, 255, 0.9)
          )
        ),
      ),
      onTap: () {
        print('tap find');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 20.0),
      height: 64.0,
      color: Constants.primaryColor,
      child: new Center(
        child: new Container(
          height: 44.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  myTabButton(),
                  musicHallTabButton(),
                  findTabButton()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}