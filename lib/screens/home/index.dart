import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_qq_music/screens/home/header_bar.dart' show HeaderBar;
import 'package:flutter_qq_music/screens/home/my/my_body.dart' show MyBody;
import 'package:flutter_qq_music/screens/home/music_hall/music_hall_body.dart' show MusicHallBody;
import 'package:flutter_qq_music/screens/home/find/find_body.dart' show FindBody;
import 'package:flutter_qq_music/components/micro_player.dart' show MicroPlayer;
import 'package:flutter_qq_music/app_state.dart' show AppState;
import 'package:flutter_qq_music/constants/index.dart' show HomeTabs;

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
          child: new StoreConnector<AppState, HomeTabs>(
            builder: (context, tabType) {
              if (tabType == HomeTabs.MY) {
                return new MyBody();
              } else if (tabType == HomeTabs.MUSIC_HALL) {
                return new MusicHallBody();
              }
              return new FindBody();
            },
            converter: (store) => store.state.homeState.tabType
          ),
        ),
        new MicroPlayer()
      ]
    );
  }
}