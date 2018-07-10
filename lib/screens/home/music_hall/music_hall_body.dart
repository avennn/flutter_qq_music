import 'package:flutter/material.dart';
import './carousel_category_stack.dart' show CarouselCategoryStack;
import './brief_recommend.dart' show BriefRecommend;
import './recommend_song_list.dart' show RecommendSongList;

class MusicHallBody extends StatefulWidget {
  @override
  MusicHallBodyState createState() => new MusicHallBodyState();


}

class MusicHallBodyState extends State<MusicHallBody> {
  Widget content() {
    return new Container(
      height: 1000.0,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new CarouselCategoryStack(),
          new BriefRecommend(),
          new RecommendSongList()
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