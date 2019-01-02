import 'package:flutter_qq_music/app_state.dart';
import 'package:flutter_qq_music/screens/home/reactive.dart' show homeReducer;

AppState appReducer(AppState state, dynamic action) => AppState(
  homeReducer(state.homeState, action)
);