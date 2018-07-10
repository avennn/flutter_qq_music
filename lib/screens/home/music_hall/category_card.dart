import 'package:flutter/material.dart';
import '../../../constants/index.dart';
import '../../singer/index.dart';
import '../../rank/index.dart';
import '../../classified_song_list/index.dart';
import '../../radio_station/index.dart';
import '../../video/index.dart';

class CategoryCard extends StatefulWidget {
  @override
  CategoryCardState createState() => new CategoryCardState();
}

class CategoryCardState extends State<CategoryCard> {

  void navigate(BuildContext context, String category) {
    Navigator.push(context, new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        switch (category) {
          case 'RANK':
            return new RankScreen();
          case 'CLASSIFIED_SONG_LIST':
            return new ClassifiedSongListScreen();
          case 'RADIO_STATION':
            return new RadioStationScreen();
          case 'VIDEO':
            return new VideoScreen();
          default:
            return new SingerScreen();
        }
      }
    ));
  }

  Widget createCategoryItem(BuildContext context, IconData icon, String title, String category) {
    return new GestureDetector(
      child: new Container(
        color: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              icon,
              color: Constants.primaryColor,
              size: 26.0,
            ),
            new Text(
              title,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ),
      onTap: () { print('tap'); navigate(context, category); }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: Constants.defaultSideGap),
      height: 90.0,
      color: Colors.white,
      child: new Container(
        margin: EdgeInsets.only(bottom: Constants.defaultSideGap),
        child: new Material(
          elevation: 2.0,
          shadowColor: const Color.fromRGBO(127, 127, 127, 0.3),
          child: new Container(
            color: Colors.white,
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.person, '歌手', 'SINGER')
                ),
                new Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.equalizer, '排行', 'RANK')
                ),
                new Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.dashboard, '分类歌单', 'CLASSIFIED_SONG_LIST')
                ),
                new Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.wifi_tethering, '电台', 'RADIO_STATION')
                ),
                new Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.videocam, '视频', 'VIDEO')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}