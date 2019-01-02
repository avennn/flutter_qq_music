import 'package:flutter/material.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;

class SongListCard extends StatelessWidget {
  final _hGap = 3.0;
  var playDesc;

  SongListCard(this.playDesc);

  Widget playTimesContainer() {
    return this.playDesc == null ? Container() :
      Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 2.0),
          child: Icon(
            Icons.headset,
            color: Color.fromRGBO(255, 255, 255, 0.6),
            size: 13.0,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 4.0),
          child: Text(
            this.playDesc,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.6),
              fontSize: 11.0,
              fontWeight: FontWeight.w200
            )
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = (DeviceInfo().getDeviceWidth(context) - _hGap * 2) / 3;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Image.asset(
          'assets/images/home/brief_recommend_radio_station.jpg',
          height: height,
        ),
        Container(
          padding: EdgeInsets.only(left: 6.0, right: 6.0, bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              playTimesContainer(),
              Icon(
                  Icons.play_circle_outline,
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  size: 24.0
              )
            ],
          ),
        )
      ],
    );
  }
}