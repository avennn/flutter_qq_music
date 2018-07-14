import 'package:flutter/material.dart';

class ChangeRecommendBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              print('on tab change a batch');
            },
            child: new Container(
              padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 5.0),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
                  border: new Border.all(
                      color: Colors.black,
                      width: 0.5
                  )
              ),
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.loop,
                    size: 16.0,
                    color: Colors.black,
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: new Text(
                      '换一批',
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.0
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}