import 'package:flutter/material.dart';

class ChangeRecommendBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print('on tab change a batch');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  border: Border.all(
                      color: Colors.black,
                      width: 0.5
                  )
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.loop,
                    size: 16.0,
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '换一批',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 14.0
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}