import 'package:flutter/material.dart';
import '../../constants/index.dart';

class MicroPlayer extends StatefulWidget {
  @override
  MicroPlayerState createState() => new MicroPlayerState();
}

class MicroPlayerState extends State<MicroPlayer> {
  final _playerHeight = 56.0;

  Widget playBarLeftSide() {
    return new GestureDetector(
      onTap: () {
        print('click micro player song container');
      },
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              height: 40.0,
              width: 40.0,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    alignment: FractionalOffset.center,
                    image: new AssetImage('assets/images/home/brief_recommend_radio_station.jpg'),
                  )
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  '易燃易爆炸(Live)',
                  style: new TextStyle(
                      color: Constants.defaultFontColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400
                  ),
                ),
                new Text(
                  '华晨宇',
                  style: new TextStyle(
                      color: Constants.defaultFontColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget playBarRightSide() {
    return new Row(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(left: 8.0, right: 6.0),
          height: _playerHeight,
//          color: Colors.red,
          child: new GestureDetector(
            onTap: () {
              print('click play button');
            },
            child: new Icon(
              Icons.play_circle_outline,
              size: 36.0,
              color: Constants.primaryColor,
            )
          ),
        ),
        new Container(
          padding: EdgeInsets.only(left: 6.0, right: 12.0),
          height: _playerHeight,
//          color: Colors.blue,
          child: new GestureDetector(
            onTap: () {
              print('click song list button');
            },
            child: new Icon(
              Icons.queue_music,
              size: 34.0,
              color: Constants.primaryColor,
            ),
          ),
        )
      ],
    );
  }

  Widget playBar() {
    return new Row(
      children: <Widget>[
        new Expanded(
          flex: 1,
          child: playBarLeftSide(),
        ),
        playBarRightSide()
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: _playerHeight,
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          new BoxShadow(
            blurRadius: 3.0,
            color: const Color.fromRGBO(127, 127, 127, 0.3),
            offset: new Offset(0.0, 1.0),
            spreadRadius: 0.0
          )
        ]
      ),
      child: playBar(),
    );
  }
}