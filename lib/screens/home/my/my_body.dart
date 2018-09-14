import 'package:flutter/material.dart';
import 'package:flutter_qq_music/constants/index.dart' show Constants;
import 'package:flutter_qq_music/screens/home/my/personal_center_card.dart' show PersonalCenterCard;
import 'package:flutter_qq_music/screens/home/my/category_wrap.dart' show CategoryWrap;
import 'package:flutter_qq_music/screens/home/my/song_list.dart' show SongList;
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;

class MyBody extends StatefulWidget {
  @override
  MyBodyState createState() => new MyBodyState();


}

class MyBodyState extends State<MyBody> {
  Widget content() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new PersonalCenterCard(),
        new CategoryWrap(),
        new SongList()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: DeviceInfo().getDeviceWidth(context),
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(top: new BorderSide(color: Constants.primaryColor, width: 6.0, style: BorderStyle.solid))
            ),
          ),
          new Container(
            decoration: new BoxDecoration(color: Colors.transparent),
            child: new SingleChildScrollView(
              child: content(),
            ),
          )
        ],
      ),
    );
  }
}