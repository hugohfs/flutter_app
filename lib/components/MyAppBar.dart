import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key key, Widget title, List<Widget> actions})
      : super(key: key, title: title, actions: <Widget>[
    /*new IconButton(
        icon: new Icon(Icons.notifications_none),
        onPressed: () => print("tap"))*/
  ]);
}