import 'package:flutter/material.dart';
import './screens/splash/index.dart';
import './constants/index.dart';

void main() => runApp(new FlutterQQMusic());

class FlutterQQMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(
        primaryColor: Constants.primaryColor,
      ),
      home: new SplashScreen()
    );
  }
}
