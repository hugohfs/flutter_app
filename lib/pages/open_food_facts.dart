import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hfs_flutter_app/models/OpenFoodFacts/OffObject.dart';
import 'package:hfs_flutter_app/models/OpenFoodFacts/Post.dart';
import 'package:hfs_flutter_app/services/authentication.dart';
import 'package:http/http.dart' as http;

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
  Future<Post> _post;
  Future<OffObject> _OffObject;

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
                  _showButtonGetFromLocalFile(),
                  _showButtonGetFromAPI(),
                  _showTextResult(),
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

  Widget _showButtonGetFromLocalFile() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Center(
          child: RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Text('Read data from JSON File',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          _getDataFromFile(context);
        },
      )),
    );
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
        child: Text('Read data JSON API',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          _getDataFromAPI(context);
        },
      )),
    );
  }

  Widget _showTextResult() {
    if (_OffObject != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: FutureBuilder<OffObject>(
            future: _OffObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(shrinkWrap: true, children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: new Wrap(
                          children: <Widget>[
                            Text("Generic Name: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(snapshot.data.product.genericName)
                          ]
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: new Wrap(
                          children: <Widget>[
                            Text("Ingredients text: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(snapshot.data.product.ingredientsText)
                          ]
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: new Wrap(
                          children: <Widget>[
                            Text("Nutriments: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(snapshot.data.product.nutriments.toString())
                          ]
                      )
                  )
                ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ));
    } else if (_textMessage.length > 0 && _textMessage != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: new Text(
            _textMessage,
            style: TextStyle(
                fontSize: 13.0,
                color: Colors.black,
                height: 1.0,
                fontWeight: FontWeight.w400),
          ));
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  _getDataFromFile(BuildContext context) async {
    // WAY 1
    String jsonString = "";
    jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/Open_Food_Facts_JSON_Example_HFS.json");
    //print("jsonString:" + jsonString);

    Map userMap = jsonDecode(jsonString);
    var model = OffObject.fromJson(userMap);
    //print(model.product.genericNameFr);

    // WAY 2
    Map<String, dynamic> dmap = await DefaultAssetBundle.of(context)
        .loadString("assets/Open_Food_Facts_JSON_Example_HFS.json")
        .then((jsonStr) => jsonDecode(jsonStr));
    //print(dmap);

    OffObject offModel = new OffObject.fromJson(dmap);
    //print(offModel.product.genericNameFr);

    setState(() {
      _textMessage = "genericName: " + model.product.genericName + "\n\n" +
          "ingredientsText: " + model.product.ingredientsText + "\n\n" +
          "nutriments: " + model.product.nutriments.toString();
      //_textMessage = offModel.product.nutriments.toString();
      _post = null;
      _OffObject = null;
    });
  }

  _getDataFromAPI(BuildContext context) {
    setState(() {
      _OffObject = _fetchOffObject();
      //_post = _fetchPost();
      _textMessage = null;
    });
  }

  Future<Post> _fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<OffObject> _fetchOffObject() async {
    final response = await http.get(
        'https://world.openfoodfacts.org/api/v0/product/737628064502.json');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return OffObject.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
