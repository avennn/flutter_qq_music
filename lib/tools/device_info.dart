import 'package:flutter/material.dart';

class DeviceInfo {
  // get the width of your device
  double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}