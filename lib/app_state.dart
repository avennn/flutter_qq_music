import 'package:flutter_qq_music/constants/index.dart' show HomeTabs;
import 'package:flutter_qq_music/screens/home/reactive.dart' show HomeState;

// 顶层的app状态管理
class AppState {
  HomeState homeState;

  AppState(
    this.homeState
  );

  static initial() {
    return new AppState(
      HomeState.initial()
    );
  }
}
