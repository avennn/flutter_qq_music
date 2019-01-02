import 'package:flutter/material.dart';
import '../constants/index.dart' show Constants;

class MicroPlayer extends StatefulWidget {
  @override
  MicroPlayerState createState() => MicroPlayerState();
}

class MicroPlayerState extends State<MicroPlayer> {
  final _playerHeight = 56.0;

  Widget playBarLeftSide() {
    return GestureDetector(
      onTap: () {
        print('click micro player song container');
      },
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0),
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.center,
                  image: AssetImage('assets/images/home/brief_recommend_radio_station.jpg'),
                )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '易燃易爆炸(Live)',
                  style: TextStyle(
                      color: Constants.defaultFontColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Text(
                  '华晨宇',
                  style: TextStyle(
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
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 8.0, right: 6.0),
          height: _playerHeight,
//          color: Colors.red,
          child: GestureDetector(
            onTap: () {
              print('click play button');
            },
            child: Icon(
              Icons.play_circle_outline,
              size: 36.0,
              color: Constants.primaryColor,
            )
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 6.0, right: 12.0),
          height: _playerHeight,
//          color: Colors.blue,
          child: GestureDetector(
            onTap: () {
              print('click song list button');
            },
            child: Icon(
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
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: playBarLeftSide(),
        ),
        playBarRightSide()
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _playerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 3.0,
            color: const Color.fromRGBO(127, 127, 127, 0.3),
            offset: Offset(0.0, 1.0),
            spreadRadius: 0.0
          )
        ]
      ),
      child: playBar(),
    );
  }
}