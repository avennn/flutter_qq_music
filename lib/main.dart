import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
//import 'package:redux_logging';
import 'package:flutter_qq_music/screens/splash/index.dart';
import 'package:flutter_qq_music/screens/home/index.dart';
import 'package:flutter_qq_music/constants/index.dart' show Constants;
import 'package:flutter_qq_music/app_state.dart';
import 'package:flutter_qq_music/app_reducer.dart' show appReducer;

void main() {
  final store = new Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
  );
  runApp(new FlutterQQMusic(store: store));
}

class FlutterQQMusic extends StatelessWidget {
  final Store<AppState> store;

  FlutterQQMusic({Key key, this.store}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Flutter QQ Music',
        theme: new ThemeData(
          primaryColor: Constants.primaryColor
        ),
        home: new HomeScreen()
      )
    );
  }
}
