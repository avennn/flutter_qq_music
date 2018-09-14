import 'package:redux/redux.dart';
import 'package:flutter_qq_music/constants/index.dart' show HomeTabs, MySongListTabs;

class MySongListObject {
  String id;
  String assetUri;
  String name;
  int totalAmount;
  int downloadedAmount;
  MySongListObject(this.id, this.name, this.assetUri, this.totalAmount, this.downloadedAmount);
}

// State
class HomeState {
  HomeTabs tabType;
  MySongListTabs mySongListTabType;
  List<MySongListObject> selfBuildSongList;
  List<MySongListObject> collectSongList;
  bool showQuickFuncModal;


  HomeState(
    this.tabType,
    this.mySongListTabType,
    this.selfBuildSongList,
    this.collectSongList,
    this.showQuickFuncModal
  );

  static initial() {
    List<MySongListObject> selfBuildSongList = new List();
    List<MySongListObject> collectSongList = new List();
    selfBuildSongList.add(
      new MySongListObject('0', '周杰伦', 'assets/images/home/brief_recommend_radio_station.jpg', 6, 5)
    );
    selfBuildSongList.add(
      new MySongListObject('0', '陈奕迅', 'assets/images/home/brief_recommend_radio_station.jpg', 13, 8)
    );
    selfBuildSongList.add(
      new MySongListObject('0', '粤语', 'assets/images/home/brief_recommend_radio_station.jpg', 30, 30)
    );
    selfBuildSongList.add(
      new MySongListObject('0', '默认收藏', 'assets/images/home/brief_recommend_radio_station.jpg', 89, 88)
    );

    return new HomeState(
      HomeTabs.MUSIC_HALL,
      MySongListTabs.SELF_BUILD,
      selfBuildSongList,
      collectSongList,
      false
    );
  }
}


// Actions
class SwitchTabAction {
  HomeTabs tabType;

  SwitchTabAction(this.tabType);
}

class SwitchMySongListTabAction {
  MySongListTabs mySongListTabType;

  SwitchMySongListTabAction(this.mySongListTabType);
}

class ChangeQuickFuncModalShowStatusAction {
  bool showQuickFuncModal;

  ChangeQuickFuncModalShowStatusAction(this.showQuickFuncModal);
}


// Reducers
HomeState switchTabReducer(HomeState state, SwitchTabAction action) {
  return new HomeState(
      action.tabType,
      state.mySongListTabType,
      state.selfBuildSongList,
      state.collectSongList,
      state.showQuickFuncModal
  );
}

HomeState switchMySongListTabReducer(HomeState state, SwitchMySongListTabAction action) {
  return new HomeState(
      state.tabType,
      action.mySongListTabType,
      state.selfBuildSongList,
      state.collectSongList,
      state.showQuickFuncModal
  );
}

HomeState changeQuickFuncModalShowStatusReducer(HomeState state, ChangeQuickFuncModalShowStatusAction action) {
  return new HomeState(
      state.tabType,
      state.mySongListTabType,
      state.selfBuildSongList,
      state.collectSongList,
      action.showQuickFuncModal
  );
}


Reducer<HomeState> homeReducer = combineReducers<HomeState>([
  new TypedReducer<HomeState, SwitchTabAction>(switchTabReducer),
  new TypedReducer<HomeState, SwitchMySongListTabAction>(switchMySongListTabReducer),
  new TypedReducer<HomeState, ChangeQuickFuncModalShowStatusAction>(changeQuickFuncModalShowStatusReducer),
]);