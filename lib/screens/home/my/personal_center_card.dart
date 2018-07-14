import 'package:flutter/material.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;
import 'package:flutter_qq_music/constants/index.dart' show Constants;

class PersonalCenterCard extends StatefulWidget {
  @override
  PersonalCenterCardState createState() => new PersonalCenterCardState();
}

class PersonalCenterCardState extends State<PersonalCenterCard> {
  Widget personalInfoWithoutLogin() {
    return new GestureDetector(
      onTap: () {
        print('pop up login modal');
      },
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.center,
                        image: new AssetImage('assets/images/home/brief_recommend_radio_station.jpg'),
                      )
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(left: 6.0),
                  child: new Text(
                    '立即登录享专属推荐',
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget activityCenter() {
    return new GestureDetector(
      onTap: () {
        print('tap activity center');
      },
      child: new Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 12.0, bottom: 21.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.bookmark_border,
                  color: Constants.defaultGrey,
                  size: 18.0,
                ),
                new Container(
                  margin: EdgeInsets.only(left: 3.0),
                  child: new Text(
                    '活动中心',
                    style: new TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0
                    ),
                  ),
                )
              ],
            ),
            new Text(
              '完成听歌任务领奖励',
              style: new TextStyle(
                  color: Constants.defaultGrey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget vipCenter() {
    return new GestureDetector(
      onTap: () {
        print('tap vip center');
      },
      child: new Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 12.0, bottom: 21.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.stars,
                  color: Constants.defaultGrey,
                  size: 18.0,
                ),
                new Container(
                  margin: EdgeInsets.only(left: 3.0),
                  child: new Text(
                    '会员中心',
                    style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0
                    ),
                  )
                )
              ],
            ),
            new Text(
              '豪华绿钻独享DTS音效',
              style: new TextStyle(
                  color: Constants.defaultGrey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget centerRow() {
    return new Row(
      children: <Widget>[
        new Expanded(
          flex: 1,
          child: activityCenter(),
        ),
        new Container(
          width: 0.5,
          height: 20.0,
          color: Colors.black
        ),
        new Expanded(
          flex: 1,
          child: vipCenter(),
        )
      ],
    );
  }

  Widget card() {
    return new Container(
      color: Colors.white,
      child: new Material(
        elevation: 2.0,
        shadowColor: const Color.fromRGBO(127, 127, 127, 0.3),
        child: new Container(
          padding: EdgeInsets.only(top: 15.0),
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              personalInfoWithoutLogin(),
              centerRow()
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      width: DeviceInfo().getDeviceWidth(context),
      child: card()
    );
  }
}