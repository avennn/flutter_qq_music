import 'package:flutter/material.dart';
import 'package:flutter_qq_music/constants/index.dart' show Constants;
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;

class CategoryWrap extends StatefulWidget {
  @override
  CategoryWrapState createState() => new CategoryWrapState();
}

class CategoryWrapState extends State<CategoryWrap> {
  Widget card(IconData icon, String title, {dynamic amount} ) {
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: DeviceInfo().getDeviceWidth(context) / 3,
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 36.0,
            color: Constants.primaryColor,
          ),
          new Text(
            title,
            style: new TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w400
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 2.0),
            child: new Text(
              amount != null ? amount.toString() : '',
              style: new TextStyle(
                  color: Constants.defaultGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 9.0),
      child: new Wrap(
        children: <Widget>[
          card(Icons.headset, '全部音乐', amount: 107),
          card(Icons.save_alt, '下载音乐', amount: 100),
          card(Icons.schedule, '最近播放', amount: 200),
          card(Icons.favorite_border, '我喜欢', amount: 9),
          card(Icons.alternate_email, '已购音乐'),
          card(Icons.directions_run, '跑步电台')
        ],
      )
    );
  }
}