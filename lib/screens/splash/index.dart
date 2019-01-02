import 'dart:async';
import 'package:flutter/material.dart';
import '../home/index.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1s用于测试
    startTimeout(context, 1000);
    return Material(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Image.asset('assets/images/splash.jpg'),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Product By Javen',
              style: TextStyle(
                color: Color(0xFF42A5F5)
              ),
            ),
          )
        ],
      ),
    );
  }

  handleTimeoutCallback(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return HomeScreen();
      }
    ));
  }

  startTimeout(BuildContext context, [int milliseconds]) {
    // 默认3s
    const sec = const Duration(seconds: 3);
    const ms = const Duration(milliseconds: 1);
    var duration = milliseconds == null ? sec : ms * milliseconds;
    return Timer(duration, () => handleTimeoutCallback(context));
  }
}
