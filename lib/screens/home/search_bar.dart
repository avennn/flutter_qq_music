import 'package:flutter/material.dart';
import '../../constants/index.dart';

class SearchBar extends StatelessWidget {
  Widget searchButton() {
    return new GestureDetector(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              color: const Color.fromRGBO(84, 167, 114, 1.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(right: 6.0, top: 2.0),
                    child: new Icon(
                      Icons.search,
                      size: 20.0,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  new Text(
                    '搜索',
                    style: new TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromRGBO(255, 255, 255, 0.7)
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      onTap: () => print('tap search button')
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      color: Constants.primaryColor,
      child: searchButton()
    );
  }
}