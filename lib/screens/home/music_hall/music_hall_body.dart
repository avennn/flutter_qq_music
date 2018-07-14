import 'package:flutter/material.dart';
import './carousel_category_stack.dart' show CarouselCategoryStack;
import './brief_recommend.dart' show BriefRecommend;
import './recommend_song_list.dart' show RecommendSongList;
import 'package:flutter_qq_music/screens/home/music_hall/change_recommend_bar.dart' show ChangeRecommendBar;

class MusicHallBody extends StatefulWidget {
  @override
  MusicHallBodyState createState() => new MusicHallBodyState();


}

class MusicHallBodyState extends State<MusicHallBody> {
  Widget content() {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new CarouselCategoryStack(),
          new BriefRecommend(),
          new RecommendSongList(),
          new ChangeRecommendBar()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new SingleChildScrollView(
        child: content(),
      ),
    );
  }
}