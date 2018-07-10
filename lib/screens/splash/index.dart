import 'dart:async';
import 'package:flutter/material.dart';
import '../home/index.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1s用于测试
    startTimeout(context, 1000);
    return new Material(
      child: new Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          new Image.asset('assets/images/splash.jpg'),
          new Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: new Text(
              'Product By Javen',
              style: new TextStyle(
                color: new Color(0xFF42A5F5)
              ),
            ),
          )
        ],
      ),
    );
  }

  handleTimeoutCallback(BuildContext context) {
    Navigator.pushReplacement(context, new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return new HomeScreen();
      }
    ));
  }

  startTimeout(BuildContext context, [int milliseconds]) {
    // 默认3s
    const sec = const Duration(seconds: 3);
    const ms = const Duration(milliseconds: 1);
    var duration = milliseconds == null ? sec : ms * milliseconds;
    return new Timer(duration, () => handleTimeoutCallback(context));
  }
}
