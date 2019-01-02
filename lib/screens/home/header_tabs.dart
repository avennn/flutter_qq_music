import 'package:flutter/material.dart';
import 'package:flutter_qq_music/constants/index.dart' show Constants, HomeTabs;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_qq_music/screens/home/reactive.dart' show SwitchTabAction, HomeState;
import 'package:flutter_qq_music/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HeaderTabs extends StatefulWidget {
  @override
  HeaderTabsState createState() => HeaderTabsState();
}

class HeaderTabsState extends State<HeaderTabs> {
  Widget myTabButton(HomeTabs tabType) {
    return GestureDetector(
        child: Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
        height: 44.0,
        child: Text(
          '我的',
          style: TextStyle(
            fontSize: tabType == HomeTabs.MY ? 18.0 : 17.0,
            fontWeight: tabType == HomeTabs.MY ? FontWeight.w600 : FontWeight.w400,
            color: const Color.fromRGBO(255, 255, 255, 0.9)
          ),
        ),
      ),
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(SwitchTabAction(HomeTabs.MY));
      }
    );
  }

  Widget musicHallTabButton(HomeTabs tabType) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
        height: 44.0,
        child: Text(
          '音乐馆',
          style: TextStyle(
            fontSize: tabType == HomeTabs.MUSIC_HALL ? 18.0 : 17.0,
            fontWeight: tabType == HomeTabs.MUSIC_HALL ? FontWeight.w600 : FontWeight.w400,
            color: const Color(0xFFFFFFFF)
          )
        )
      ),
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(SwitchTabAction(HomeTabs.MUSIC_HALL));
      }
    );
  }

  Widget findTabButton(HomeTabs tabType) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 9.0),
        height: 44.0,
        child: Text(
          '发现',
          style: TextStyle(
            fontSize: tabType == HomeTabs.FIND ? 18.0 : 17.0,
            fontWeight: tabType == HomeTabs.FIND ? FontWeight.w600 : FontWeight.w400,
            color: const Color.fromRGBO(255, 255, 255, 0.9)
          )
        ),
      ),
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(SwitchTabAction(HomeTabs.FIND));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      height: 64.0,
      color: Constants.primaryColor,
      child: Center(
        child: Container(
          height: 44.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  StoreConnector<AppState, HomeTabs>(
                    builder: (context, tabType) {
                      return myTabButton(tabType);
                    },
                    converter: (store) {
                      return store.state.homeState.tabType;
                    }
                  ),
                  StoreConnector<AppState, HomeTabs>(
                    builder: (context, tabType) {
                      return musicHallTabButton(tabType);
                    },
                    converter: (store) {
                      return store.state.homeState.tabType;
                    }
                  ),
                  StoreConnector<AppState, HomeTabs>(
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