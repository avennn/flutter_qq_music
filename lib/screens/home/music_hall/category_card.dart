import 'package:flutter/material.dart';
import '../../../constants/index.dart';
import '../../singer/index.dart';
import '../../rank/index.dart';
import '../../classified_song_list/index.dart';
import '../../radio_station/index.dart';
import '../../video/index.dart';

class CategoryCard extends StatefulWidget {
  @override
  CategoryCardState createState() => CategoryCardState();
}

class CategoryCardState extends State<CategoryCard> {

  void navigate(BuildContext context, String category) {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        switch (category) {
          case 'RANK':
            return RankScreen();
          case 'CLASSIFIED_SONG_LIST':
            return ClassifiedSongListScreen();
          case 'RADIO_STATION':
            return RadioStationScreen();
          case 'VIDEO':
            return VideoScreen();
          default:
            return SingerScreen();
        }
      }
    ));
  }

  Widget createCategoryItem(BuildContext context, IconData icon, String title, String category) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Constants.primaryColor,
              size: 26.0,
            ),
            Text(
              title,
              style: TextStyle(
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Constants.defaultSideGap),
      height: 90.0,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(bottom: Constants.defaultSideGap),
        child: Material(
          elevation: 2.0,
          shadowColor: const Color.fromRGBO(127, 127, 127, 0.3),
          child: Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.person, '歌手', 'SINGER')
                ),
                Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.equalizer, '排行', 'RANK')
                ),
                Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.dashboard, '分类歌单', 'CLASSIFIED_SONG_LIST')
                ),
                Expanded(
                    flex: 1,
                    child: createCategoryItem(context, Icons.wifi_tethering, '电台', 'RADIO_STATION')
                ),
                Expanded(
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