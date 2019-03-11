import 'package:flutter/material.dart';
import 'package:hfs_flutter_app/pages/main_StartupNameGenerator.dart';
import 'package:hfs_flutter_app/pages/main_UI.dart';
import 'package:hfs_flutter_app/pages/main_Firebase.dart';
import 'package:hfs_flutter_app/pages/todo_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MainMenu(),
  ));
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Main Page'),
      ),*/
      body: new Container(
        child: new Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  elevation: 5.0,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue,
                  child: Text('Startup Name Generator',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StartupNameGenerator()),
                    );
                  },
                ),
              ),
              Divider(color: Colors.grey, height: 10.0),
              Center(
                child: RaisedButton(
                  elevation: 5.0,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue,
                  child: Text('Friendly Chat',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FriendlyChatApp()),
                    );
                  },
                ),
              ),
              Divider(color: Colors.grey, height: 10.0),
              Center(
                child: RaisedButton(
                  elevation: 5.0,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue,
                  child: Text('Baby Name Votes',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BabyNameVotes()),
                    );
                  },
                ),
              ),
              Divider(color: Colors.grey, height: 10.0),
              Center(
                child: RaisedButton(
                  elevation: 5.0,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.blue,
                  child: Text('TodoList',
                      style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodoPage()),
                    );
                  },
                ),
              ),
            ]
        ),
      ),
    );
  }
}
