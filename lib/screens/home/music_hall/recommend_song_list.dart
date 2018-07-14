import 'package:flutter/material.dart';
import 'package:flutter_qq_music/screens/home/music_hall/recommend_header.dart' show RecommendHeader;
import 'package:flutter_qq_music/constants/index.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;
import 'package:flutter_qq_music/screens/home/music_hall/song_list_card.dart' show SongListCard;

class RecommendSongList extends StatefulWidget {
  @override
  RecommendSongListState createState() => new RecommendSongListState();
}

class RecommendSongListState extends State<RecommendSongList> {
  final _hGap = 3.0;

  Widget songListItem(String title, { String playDesc }) {
    // context no need to inject through arguments?
    double itemSideLen = (DeviceInfo().getDeviceWidth(context) - _hGap * 2) / 3;

    return new GestureDetector(
      onTap: () {
        print('tap song list item');
      },
      child: new Container(
          padding: EdgeInsets.only(bottom: 14.0),
          width: itemSideLen,
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new SongListCard(playDesc),
              new Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                alignment: AlignmentDirectional.topStart,
                child: new Text(
                  title,
                  style: new TextStyle(
                    color: Constants.defaultFontColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          )
      ),
    );
  }

  Widget wrapBody() {
    return new Wrap(
      spacing: _hGap,
      children: <Widget>[
        songListItem('今日推荐歌曲'),
        songListItem('张国荣和滚石的那些故事', playDesc: '54.3万'),
        songListItem('曾经被这些小说改变的电影感动过', playDesc: '10万'),
        songListItem('Eason，还有几个十年可以最著你', playDesc: '7.5万'),
        songListItem('周几轮粉丝打卡签到', playDesc: '16.8万'),
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