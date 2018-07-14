import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_qq_music/constants/index.dart' show Constants, MySongListTabs;
import 'package:flutter_qq_music/app_state.dart' show AppState;
import 'package:flutter_qq_music/screens/home/reactive.dart' show HomeState, SwitchMySongListTabAction, MySongListObject;
import 'package:flutter_qq_music/screens/home/my/my_song_list_card.dart' show MySongListCard;
import 'package:flutter_qq_music/screens/home/my/build_song_list_card.dart' show BuildSongListCard;

class SongList extends StatefulWidget {
  @override
  SongListState createState() => new SongListState();
}

class SongListState extends State<SongList> {
  Widget tab(MySongListTabs innerTab, MySongListTabs currentTab) {
    return new GestureDetector(
      onTap: () {
        StoreProvider.of<AppState>(context).dispatch(new SwitchMySongListTabAction(innerTab));
      },
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        color: Colors.white,
        child: new Text(
          innerTab == MySongListTabs.SELF_BUILD ? '自建歌单' : '收藏歌单',
          style: new TextStyle(
            color: innerTab == currentTab ? Colors.black : Constants.defaultGrey,
            fontWeight: FontWeight.w400,
            fontSize: 15.0
          )
        ),
      ),
    );
  }

  Widget tabsHeader() {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new StoreConnector<AppState, MySongListTabs>(
            builder: (context, tabType) {
              return tab(MySongListTabs.SELF_BUILD, tabType);
            },
            converter: (store) {
              return store.state.homeState.mySongListTabType;
            }
          ),
          new Container(
            width: 0.5,
            height: 15.0,
            color: Colors.black,
          ),
          new StoreConnector<AppState, MySongListTabs>(
            builder: (context, tabType) {
              return tab(MySongListTabs.COLLECT, tabType);
            },
            converter: (store) {
              return store.state.homeState.mySongListTabType;
            }
          )
        ],
      ),
    );
  }

  Widget menuBar() {
    return new StoreConnector<AppState, MySongListTabs>(
        builder: (context, tabType) {
          return new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new StoreConnector<AppState, String>(
                  builder: (context, countStr) {
                    return new Text(
                      countStr + '个歌单',
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400
                      ),
                    );
                  },
                  converter: (store) {
                    HomeState homeState = store.state.homeState;
                    List<MySongListObject> songList = homeState.mySongListTabType == MySongListTabs.SELF_BUILD ? homeState.selfBuildSongList : homeState.collectSongList;
                    return songList.length.toString();
                  }
                ),
                new Row(
                  children: <Widget>[
                    tabType == MySongListTabs.SELF_BUILD ? new GestureDetector(
                      onTap: () {
                        print('tab plus icon');
                      },
                      child: new Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                        margin: EdgeInsets.only(right: 12.0),
                        child: new Icon(
                            Icons.add,
                            size: 20.0,
                            color: Colors.black
                        ),
                      ),
                    ) : new Container(),
                    new GestureDetector(
                      onTap: () {
                        print('tap list icon');
                      },
                      child: new Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                        child: new Icon(
                            Icons.format_list_bulleted,
                            size: 20.0,
                            color: Colors.black
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        converter: (store) {
          return store.state.homeState.mySongListTabType;
        }
    );
  }

  Widget cardContainerColumn(MySongListTabs tabType, List<MySongListObject> songList) {
    List<Widget> cardListContainer = new List();
    if (songList.length == 0) {
      if (tabType == MySongListTabs.SELF_BUILD) {
        return new BuildSongListCard();
      }
      return new Container(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: new Center(
          child: new Text(
            '没有收藏歌单',
            style: new TextStyle(
              color: Constants.defaultGrey,
              fontSize: 14.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      );
    }

    for (int i = 0; i < songList.length; i++) {
      cardListContainer.add(
        new Container(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: new MySongListCard(songList[i]),
        )
      );
    }
    return new Column(
      children: cardListContainer,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: new Column(
        children: <Widget>[
          tabsHeader(),
          menuBar(),
          new StoreConnector<AppState, HomeState>(
            builder: (context, homeState) {
              List<MySongListObject> list = homeState.mySongListTabType == MySongListTabs.SELF_BUILD ?
                homeState.selfBuildSongList : homeState.collectSongList;
              return new Container(
                margin: EdgeInsets.only(top: 7.0),
                child: cardContainerColumn(homeState.mySongListTabType, list),
              );
            },
            converter: (store) {
              return store.state.homeState;
            }
          )
        ],
      ),
    );
  }
}