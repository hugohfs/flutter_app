import 'package:flutter/material.dart';
import 'package:flutter_app/main_StartupNameGenerator.dart';
import 'package:flutter_app/main_UI.dart';
import 'package:flutter_app/main_Firebase.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: new Container(
        child: new Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text('Startup Name Generator'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StartupNameGenerator()),
                    );
                  },
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text('Friendly Chat'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FriendlyChatApp()),
                    );
                  },
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text('Baby Name Votes'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BabyNameVotes()),
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

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}