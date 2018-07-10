import 'package:flutter/material.dart';
import './header_bar.dart' show HeaderBar;
import './music_hall/music_hall_body.dart' show MusicHallBody;
import './micro_player.dart' show MicroPlayer;

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new HeaderBar(),
        new Expanded(
          flex: 1,
          child: new MusicHallBody(),
        ),
        new MicroPlayer()
      ]
    );
  }
}