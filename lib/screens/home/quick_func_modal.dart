import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;
import 'package:flutter_qq_music/app_state.dart' show AppState;
import 'package:flutter_qq_music/screens/home/reactive.dart' show ChangeQuickFuncModalShowStatusAction;
import 'package:flutter_qq_music/constants/index.dart' show Constants;

class QuickFuncModal extends StatefulWidget {
  @override
  QuickFuncModalState createState() => new QuickFuncModalState();
}

class QuickFuncModalState extends State<QuickFuncModal> {
  final deltaWidth = 18.0;
  final deltaHeight = 9.0;
  final panWidth = 150.0;
  final perColumnHeight = 40.0;
  final radius = 7.0;
  final menuBtnPaddingLeft = 15.0;

  Widget delta() {
    return new Container(
      width: deltaWidth,
      height: deltaHeight,
      decoration: new BoxDecoration(
        color: Colors.transparent,
        border: new Border(
          bottom: new BorderSide(color: Colors.white, width: deltaHeight, style: BorderStyle.solid),
          top: new BorderSide(color: Colors.transparent, width: 0.0, style: BorderStyle.solid),
          left: new BorderSide(color: Colors.transparent, width: deltaWidth / 2, style: BorderStyle.solid),
          right: new BorderSide(color: Colors.transparent, width: deltaWidth / 2, style: BorderStyle.solid)
        )
      ),
    );
  }

  Widget menuButton(IconData icon, String text) {
    return new Row(
      children: <Widget>[
        new Icon(
          icon,
          size: 24.0,
          color: Constants.primaryColor
        ),
        new Container(
          padding: EdgeInsets.only(left: 13.0),
          child: new Text(
            text,
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.0
            ),
          ),
        )
      ],
    );
  }

  Widget panContent() {
    return new Column(
      children: <Widget>[
        new Expanded(
          flex: 1,
          child: new GestureDetector(
            onTap: () {
              print('点击听歌识曲');
            },
            child: new Container(
              padding: EdgeInsets.only(left: menuBtnPaddingLeft),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(topLeft: new Radius.circular(radius), topRight: new Radius.circular(radius))
              ),
              child: menuButton(Icons.hearing, '听歌识曲'),
            ),
          ),
        ),
        new Container(
            height: 0.5,
            color: const Color.fromRGBO(220, 220, 220, 0.8)
        ),
        new Expanded(
          flex: 1,
          child: new GestureDetector(
            onTap: () {
              print('点击扫一扫');
            },
            child: new Container(
              padding: EdgeInsets.only(left: menuBtnPaddingLeft),
              color: Colors.white,
              child: menuButton(Icons.filter_center_focus, '扫一扫'),
            ),
          ),
        ),
        new Container(
          height: 0.5,
          color: const Color.fromRGBO(220, 220, 220, 0.8)
        ),
        new Expanded(
          flex: 1,
          child: new GestureDetector(
            onTap: () {
              print('点击视频海报');
            },
            child: new Container(
              padding: EdgeInsets.only(left: menuBtnPaddingLeft),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(bottomLeft: new Radius.circular(radius), bottomRight: new Radius.circular(radius))
              ),
              child: menuButton(Icons.live_tv, '视频海报'),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        new StoreConnector<AppState, VoidCallback>(
          builder: (context, callback) {
            return new GestureDetector(
              onTap: () {
                callback();
              },
              child: new Container(
                width: DeviceInfo().getDeviceWidth(context),
                height: DeviceInfo().getDeviceHeight(context),
                color: const Color.fromRGBO(0, 0, 0, 0.2),
              ),
            );
           },
          converter: (store) {
            // hide modal
            return () => store.dispatch(new ChangeQuickFuncModalShowStatusAction(false));
          }
        ),
        new Container(
          margin: EdgeInsets.only(top: 64.0 - deltaHeight, right: 4.0),
          width: panWidth,
          height: perColumnHeight * 3 + deltaHeight,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(right: 7.0),
                child: delta(),
              ),
              new Container(
                width: panWidth,
                height: perColumnHeight * 3,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(new Radius.circular(radius))
                ),
                child: panContent(),
              )
            ],
          ),
        )
      ],
    );
  }
}