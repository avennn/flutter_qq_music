import 'package:flutter/material.dart';
import './header_tabs.dart';
import './search_bar.dart';
import '../../constants/index.dart';

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

  Widget createSideContainer(String side, IconData icon, double size) {
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
                onPressed: () => onPressedSideContainer(side),
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
        createSideContainer('left', Icons.menu, 24.0),
        new Expanded(
          flex: 1,
          child: new HeaderTabs(),
        ),
        createSideContainer('right', Icons.add, 26.0)
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