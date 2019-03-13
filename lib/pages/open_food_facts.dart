import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hfs_flutter_app/models/OpenFoodFacts/OFF_model.dart';
import 'package:hfs_flutter_app/services/authentication.dart';

class OpenFoodFactsPage extends StatefulWidget {
  OpenFoodFactsPage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _OpenFoodFactsPageState();
}

class _OpenFoodFactsPageState extends State<OpenFoodFactsPage> {
  String _textMessage = "default";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Open Food Facts'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: _signOut)
          ],
        ),
        body: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showButtonGetFromAPI(),
                  _showTextMessage(),
                ],
              ),
            )));
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  _getDataFromFile(BuildContext context) async {
    // WAY 1
    String jsonString = "";
    jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/Open_Food_Facts_JSON_Example_HFS.json");
    //print("jsonString:" + jsonString);

    Map userMap = jsonDecode(jsonString);
    var model = OFFModel.fromJson(userMap);
    //print(model.product.genericNameFr);

    // WAY 2
    Map<String, dynamic> dmap = await DefaultAssetBundle.of(context)
        .loadString("assets/Open_Food_Facts_JSON_Example_HFS.json")
        .then((jsonStr) => jsonDecode(jsonStr));
    //print(dmap);

    OFFModel offModel = new OFFModel.fromJson(dmap);
    //print(offModel.product.genericNameFr);


    setState(() {
      _textMessage = model.product.nutriments.toString();
      //_textMessage = offModel.product.nutriments.toString();
    });
  }

  Widget _showButtonGetFromAPI() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Center(
          child: RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Text('Read JSON data',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          _getDataFromFile(context);
        },
      )),
    );
  }

  Widget _showTextMessage() {
    if (_textMessage.length > 0 && _textMessage != null) {
      return new Text(
        _textMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.black,
            height: 1.0,
            fontWeight: FontWeight.w400),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
