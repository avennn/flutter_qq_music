import 'package:flutter/material.dart';
import 'package:flutter_qq_music/constants/index.dart' show Constants, HomeTabs;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_qq_music/screens/home/reactive.dart' show SwitchTabAction, HomeState;
import 'package:flutter_qq_music/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HeaderTabs extends StatefulWidget {
  @override
  HeaderTabsState createState() => new HeaderTabsState();
}

class HeaderTabsState extends State<HeaderTabs> {
  Widget myTabButton(HomeTabs tabType) {
    return new GestureDetector(
        child: new Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
        height: 44.0,
        child: new Text(
          '我的',
          style: new TextStyle(
            fontSize: tabType == HomeTabs.MY ? 18.0 : 17.0,
            fontWeight: tabType == HomeTabs.MY ? FontWeight.w600 : FontWeight.w400,
            color: const Color.fromRGBO(255, 255, 255, 0.9)
          ),
        ),
      ),
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(new SwitchTabAction(HomeTabs.MY));
      }
    );
  }

  Widget musicHallTabButton(HomeTabs tabType) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
        height: 44.0,
        child: Text(
          '音乐馆',
          style: new TextStyle(
            fontSize: tabType == HomeTabs.MUSIC_HALL ? 18.0 : 17.0,
            fontWeight: tabType == HomeTabs.MUSIC_HALL ? FontWeight.w600 : FontWeight.w400,
            color: const Color(0xFFFFFFFF)
          )
        )
      ),
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(new SwitchTabAction(HomeTabs.MUSIC_HALL));
      }
    );
  }

  Widget findTabButton(HomeTabs tabType) {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
        height: 44.0,
        child: new Text(
          '发现',
          style: new TextStyle(
            fontSize: tabType == HomeTabs.FIND ? 18.0 : 17.0,
            fontWeight: tabType == HomeTabs.FIND ? FontWeight.w600 : FontWeight.w400,
            color: const Color.fromRGBO(255, 255, 255, 0.9)
          )
        ),
      ),
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(new SwitchTabAction(HomeTabs.FIND));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 20.0),
      height: 64.0,
      color: Constants.primaryColor,
      child: new Center(
        child: new Container(
          height: 44.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new StoreConnector<AppState, HomeTabs>(
                    builder: (context, tabType) {
                      return myTabButton(tabType);
                    },
                    converter: (store) {
                      return store.state.homeState.tabType;
                    }
                  ),
                  new StoreConnector<AppState, HomeTabs>(
                    builder: (context, tabType) {
                      return musicHallTabButton(tabType);
                    },
                    converter: (store) {
                      return store.state.homeState.tabType;
                    }
                  ),
                  new StoreConnector<AppState, HomeTabs>(
                    builder: (context, tabType) {
                      return findTabButton(tabType);
                    },
                    converter: (store) {
                      return store.state.homeState.tabType;
                    }
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}