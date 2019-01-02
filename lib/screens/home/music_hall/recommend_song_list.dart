import 'package:flutter/material.dart';
import 'package:flutter_qq_music/screens/home/music_hall/recommend_header.dart' show RecommendHeader;
import 'package:flutter_qq_music/constants/index.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;
import 'package:flutter_qq_music/screens/home/music_hall/song_list_card.dart' show SongListCard;

class RecommendSongList extends StatefulWidget {
  @override
  RecommendSongListState createState() => RecommendSongListState();
}

class RecommendSongListState extends State<RecommendSongList> {
  final _hGap = 3.0;

  Widget songListItem(String title, { String playDesc }) {
    // context no need to inject through arguments?
    double itemSideLen = (DeviceInfo().getDeviceWidth(context) - _hGap * 2) / 3;

    return GestureDetector(
      onTap: () {
        print('tap song list item');
      },
      child: Container(
          padding: EdgeInsets.only(bottom: 14.0),
          width: itemSideLen,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SongListCard(playDesc),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  title,
                  style: TextStyle(
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
    return Wrap(
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
    return Container(
      child: Column(
        children: <Widget>[
          RecommendHeader('为你推荐歌单', 'classified_song_list'),
          wrapBody()
        ],
      ),
    );
  }
}