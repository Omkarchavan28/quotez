import 'package:flutter/material.dart';

class RightSwipeBackGround extends StatelessWidget {
  const RightSwipeBackGround({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF32FF7E),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.star,
                color: Color(0xFFFFF200),
                size: 50.0,
              ),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}

class LeftSwipeBackGround extends StatelessWidget {
  const LeftSwipeBackGround({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf56040),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.delete,
                size: 40.0,
                color:  Color(0xFFf56040),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
