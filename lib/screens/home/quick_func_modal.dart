import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;
import 'package:flutter_qq_music/app_state.dart' show AppState;
import 'package:flutter_qq_music/screens/home/reactive.dart' show ChangeQuickFuncModalShowStatusAction;
import 'package:flutter_qq_music/constants/index.dart' show Constants;

class QuickFuncModal extends StatefulWidget {
  @override
  QuickFuncModalState createState() => QuickFuncModalState();
}

class QuickFuncModalState extends State<QuickFuncModal> {
  final deltaWidth = 18.0;
  final deltaHeight = 9.0;
  final panWidth = 150.0;
  final perColumnHeight = 40.0;
  final radius = 7.0;
  final menuBtnPaddingLeft = 15.0;

  Widget delta() {
    return Container(
      width: deltaWidth,
      height: deltaHeight,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: Colors.white, width: deltaHeight, style: BorderStyle.solid),
          top: BorderSide(color: Colors.transparent, width: 0.0, style: BorderStyle.solid),
          left: BorderSide(color: Colors.transparent, width: deltaWidth / 2, style: BorderStyle.solid),
          right: BorderSide(color: Colors.transparent, width: deltaWidth / 2, style: BorderStyle.solid)
        )
      ),
    );
  }

  Widget menuButton(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 24.0,
          color: Constants.primaryColor
        ),
        Container(
          padding: EdgeInsets.only(left: 13.0),
          child: Text(
            text,
            style: TextStyle(
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
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              print('点击听歌识曲');
            },
            child: Container(
              padding: EdgeInsets.only(left: menuBtnPaddingLeft),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(radius), topRight: Radius.circular(radius))
              ),
              child: menuButton(Icons.hearing, '听歌识曲'),
            ),
          ),
        ),
        Container(
            height: 0.5,
            color: const Color.fromRGBO(220, 220, 220, 0.8)
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              print('点击扫一扫');
            },
            child: Container(
              padding: EdgeInsets.only(left: menuBtnPaddingLeft),
              color: Colors.white,
              child: menuButton(Icons.filter_center_focus, '扫一扫'),
            ),
          ),
        ),
        Container(
          height: 0.5,
          color: const Color.fromRGBO(220, 220, 220, 0.8)
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              print('点击视频海报');
            },
            child: Container(
              padding: EdgeInsets.only(left: menuBtnPaddingLeft),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius))
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
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        StoreConnector<AppState, VoidCallback>(
          builder: (context, callback) {
            return GestureDetector(
              onTap: () {
                callback();
              },
              child: Container(
                width: DeviceInfo().getDeviceWidth(context),
                height: DeviceInfo().getDeviceHeight(context),
                color: const Color.fromRGBO(0, 0, 0, 0.2),
              ),
            );
           },
          converter: (store) {
            // hide modal
            return () => store.dispatch(ChangeQuickFuncModalShowStatusAction(false));
          }
        ),
        Container(
          margin: EdgeInsets.only(top: 64.0 - deltaHeight, right: 4.0),
          width: panWidth,
          height: perColumnHeight * 3 + deltaHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 7.0),
                child: delta(),
              ),
              Container(
                width: panWidth,
                height: perColumnHeight * 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(radius))
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