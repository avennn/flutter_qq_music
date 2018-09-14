import 'package:flutter/material.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;

class FindBody extends StatefulWidget {
  @override
  FindBodyState createState() => new FindBodyState();


}

class FindBodyState extends State<FindBody> {
  Widget content() {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Text(
            '发现的主体',
            style: new TextStyle(
              color: Colors.red,
              fontSize: 18.0
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: DeviceInfo().getDeviceWidth(context),
      decoration: new BoxDecoration(color: Colors.white),
      child: new SingleChildScrollView(
        child: content(),
      ),
    );
  }
}