import 'package:flutter/material.dart';
import './header_tabs.dart';
import './search_bar.dart';
import '../../constants/index.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_qq_music/app_state.dart' show AppState;
import 'package:flutter_qq_music/screens/home/reactive.dart' show HomeState, ChangeQuickFuncModalShowStatusAction;

class HeaderBar extends StatefulWidget {
  @override
  HeaderBarState createState() => new HeaderBarState();
}

class HeaderBarState extends State<HeaderBar> {
  void onPressedSideContainer(String side) {
    if (side == 'left') {
      print('click left');
    } else {
      print('click right');
    }
  }

  Widget createSideContainer(String side, IconData icon, double size, VoidCallback callback) {
    return new Container(
        padding: EdgeInsets.only(top: 20.0),
        width: 44.0,
        height: 64.0,
        color: Constants.primaryColor,
        child: new Center(
          child: new Material(
            color: Constants.primaryColor,
            child: new IconButton(
              icon: new Icon(
                icon,
                color: const Color(0xFFFFFFFF),
                size: size,
              ),
              onPressed: callback,
            )
          ),
        )
    );
  }

  Widget createHeader() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new StoreConnector<AppState, VoidCallback>(
          builder: (context, callback) {
            return createSideContainer('left', Icons.menu, 24.0, callback);
          },
          converter: (store) {
            // todo
//            return store.dispatch(action);
          }
        ),
        new Expanded(
          flex: 1,
          child: new HeaderTabs(),
        ),
        new StoreConnector<AppState, VoidCallback>(
          builder: (context, callback) {
            return createSideContainer('right', Icons.add, 26.0, callback);
          },
          converter: (store) {
            // show quick func modal
            return () => store.dispatch(new ChangeQuickFuncModalShowStatusAction(true));
          }
        )

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        createHeader(),
        new SearchBar()
      ],
    );
  }
}