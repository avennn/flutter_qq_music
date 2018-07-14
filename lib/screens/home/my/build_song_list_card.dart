import 'package:flutter/material.dart';
import 'package:flutter_qq_music/screens/home/reactive.dart' show MySongListObject;
import 'package:flutter_qq_music/constants/index.dart' show Constants;

class BuildSongListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('on tap song list card');
      },
      child: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                new Container(
                  width: 60.0,
                  height: 60.0,
                  color: const Color.fromRGBO(220, 220, 220, 0.3),
                ),
                new Icon(
                  Icons.add,
                  size: 26.0,
                  color: Colors.grey,
                )
              ],
            ),
            new Expanded(flex: 1, child: new Container(
              padding: EdgeInsets.only(left: 10.0),
              child: new Text(
                '新建歌单',
                style: new TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0
                ),
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
