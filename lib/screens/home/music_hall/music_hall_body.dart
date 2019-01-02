import 'package:flutter/material.dart';
import './carousel_category_stack.dart' show CarouselCategoryStack;
import './brief_recommend.dart' show BriefRecommend;
import './recommend_song_list.dart' show RecommendSongList;
import 'package:flutter_qq_music/screens/home/music_hall/change_recommend_bar.dart' show ChangeRecommendBar;
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;

class MusicHallBody extends StatefulWidget {
  @override
  MusicHallBodyState createState() => MusicHallBodyState();


}

class MusicHallBodyState extends State<MusicHallBody> {
  Widget content() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          CarouselCategoryStack(),
          BriefRecommend(),
          RecommendSongList(),
          ChangeRecommendBar()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceInfo().getDeviceWidth(context),
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: content(),
      ),
    );
  }
}