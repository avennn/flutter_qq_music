import 'package:flutter/material.dart';
import 'package:flutter_qq_music/tools/device_info.dart' show DeviceInfo;

class FindBody extends StatefulWidget {
  @override
  FindBodyState createState() => FindBodyState();


}

class FindBodyState extends State<FindBody> {
  Widget content() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            '发现的主体',
            style: TextStyle(
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
    return Container(
      width: DeviceInfo().getDeviceWidth(context),
      decoration: BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: content(),
      ),
    );
  }
}