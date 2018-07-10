import 'package:flutter/material.dart';
import '../../new_song_recommend/index.dart' show NewSongRecommendScreen;
import '../../digital_album//index.dart' show DigitalAlbumScreen;
import '../../../constants/index.dart';

class BriefRecommend extends StatefulWidget {
  @override
  BriefRecommendState createState() => new BriefRecommendState();
}

class BriefRecommendState extends State<BriefRecommend> {
  final _radioContainerWidth = 130.0;
  final _vStep = 8.0;
  final _hStep = 4.0;
  get _radioContainerHeight => _radioContainerWidth - _hStep * 2;
  get _rightRowItemHeight => (_radioContainerHeight - 6.0) / 2;

  bool _isPlaying = false;

  Widget personalRadioStation() {
    return new Container(
      height: _radioContainerHeight,
      width: _radioContainerWidth,
      color: Colors.white,
      child: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.symmetric(vertical: _vStep * 2),
            color: new Color.fromRGBO(127, 127, 127, 0.2),
          ),
          new Container(
            margin: EdgeInsets.only(top: _vStep, bottom: _vStep, right: _hStep),
            color: new Color.fromRGBO(127, 127, 127, 0.4),
          ),
          new GestureDetector(
            onTap: () {
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            child: new Container(
              margin: EdgeInsets.only(right: _hStep * 2),
              child: new Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  new Container(
                    child: new Image.asset('assets/images/home/brief_recommend_radio_station.jpg', fit: BoxFit.cover,),
                  ),
                  new Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      new Container(
                        height: _radioContainerHeight,
                        width: _radioContainerWidth,
                        child: new Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: new Text(
                          '个性电台',
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }

  Widget rightRecommendItem(BuildContext context, String type, String assetUri, String title, String desc) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute<void>(builder: (BuildContext context) {
          return type == 'NEW_SONG_RECOMMEND' ? new NewSongRecommendScreen() : new DigitalAlbumScreen();
        }));
      },
      child: new Container(
        height: _rightRowItemHeight,
        decoration: new BoxDecoration(color: Color.fromRGBO(200, 200, 200, 0.2)),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Container(
                padding: EdgeInsets.only(left: 16.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      title,
                      style: new TextStyle(
                        color: Constants.defaultFontColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    new Text(
                      desc,
                      style: new TextStyle(
                          color: Constants.defaultFontColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
              )
            ),
            new Image.asset(
              assetUri,
              width: _rightRowItemHeight,
              height: _rightRowItemHeight,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget rightSideRecommend(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 10.0),
      height: _radioContainerHeight,
      color: Colors.white,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          rightRecommendItem(context, 'NEW_SONG_RECOMMEND', 'assets/images/home/brief_recommend_radio_station.jpg', '新歌推荐', '阿粉夏日回归魅力非凡'),
          rightRecommendItem(context, 'DIGITAL_ALBUM', 'assets/images/home/brief_recommend_radio_station.jpg', '数字专辑', '张艺兴双钻石认证冲刺中')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: Constants.defaultSideGap, vertical: 13.0),
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          personalRadioStation(),
          new Expanded(
            flex: 1,
            child: rightSideRecommend(context),
          )
        ],
      )
    );
  }
}