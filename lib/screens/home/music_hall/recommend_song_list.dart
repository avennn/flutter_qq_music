import 'package:flutter/material.dart';
import './recommend_header.dart' show RecommendHeader;
import '../../../constants/index.dart';
import '../../../tools/device_info.dart' show DeviceInfo;

class RecommendSongList extends StatefulWidget {
  @override
  RecommendSongListState createState() => new RecommendSongListState();
}

class RecommendSongListState extends State<RecommendSongList> {
  final _hGap = 3.0;



  Widget songListItem() {
    // context no need to inject through arguments?
    double itemSideLen = (DeviceInfo().getDeviceWidth(context) - _hGap * 2) / 3;

    return new Container(
      padding: EdgeInsets.only(bottom: 20.0),
      width: itemSideLen,
      color: Colors.red,
      child: new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Image.asset(
                  'assets/images/home/brief_recommend_radio_station.jpg',
                  height: itemSideLen,
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text(
                  '今日推荐歌曲',
                  style: new TextStyle(
                      color: Constants.defaultFontColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0
                  ),
                )
              ],
            )
          ],
        )
    );
  }

  Widget wrapBody() {
    return new Wrap(
      spacing: _hGap,
      children: <Widget>[
        songListItem(),
        songListItem(),
        songListItem(),
        songListItem(),
        songListItem(),
        songListItem(),
        songListItem(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RecommendHeader('为你推荐歌单', 'classified_song_list'),
          wrapBody()
        ],
      ),
    );
  }
}