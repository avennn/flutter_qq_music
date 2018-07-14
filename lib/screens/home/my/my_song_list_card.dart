import 'package:flutter/material.dart';
import 'package:flutter_qq_music/screens/home/reactive.dart' show MySongListObject;
import 'package:flutter_qq_music/constants/index.dart' show Constants;

class MySongListCard extends StatefulWidget {
  MySongListObject songListObj;

  MySongListCard(this.songListObj);

  @override
  MySongListCardState createState() => new MySongListCardState(this.songListObj);
}

class MySongListCardState extends State<MySongListCard> {
  MySongListObject songListObject;

  MySongListCardState(this.songListObject);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('on tap song list card' + this.songListObject.name);
      },
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Image.asset(
              this.songListObject.assetUri,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.contain,
            ),
            new Expanded(flex: 1, child: new Container(
                padding: EdgeInsets.only(left: 10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      this.songListObject.name,
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0
                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        new Icon(
                            Icons.check_circle_outline,
                            size: 12.0,
                            color: Constants.primaryColor
                        ),
                        new Container(
                          margin: EdgeInsets.only(left: 6.0),
                          child: new Text(
                            '6首, 5首已下载',
                            style: new TextStyle(
                                color: Constants.defaultGrey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            ),
            new Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: new Icon(
                Icons.chevron_right,
                color: Constants.defaultGrey,
                size: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}