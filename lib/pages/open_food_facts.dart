import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hfs_flutter_app/models/OpenFoodFacts/OffObject.dart';
import 'package:hfs_flutter_app/models/OpenFoodFacts/Post.dart';
import 'package:hfs_flutter_app/services/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    as font_awesome_flutter;
import 'package:barcode_scan/barcode_scan.dart';

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
  String _textMessage;
  Future<Post> _post;
  Future<OffObject> _OffObject;

  String _barcode;
  final _baseUrl = 'https://world.openfoodfacts.org/api/v0/product/';
  final _baseUrlEnd = '.json';
  final _formKey = new GlobalKey<FormState>();
  String _errorMessage;

  final _textEditingController = TextEditingController();

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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () { _scanQR(); },
          icon: Icon(Icons.camera_alt),
          label: Text("Scan")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
              key: _formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showButtonGetFromLocalFile(),
                  _showButtonGetFromAPI(),
                  _showInputTextBarcodeNumber(),
                  _showErrorMessage(),
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

  Widget _showInputTextBarcodeNumber() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _textEditingController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Barcode',
            icon: new Icon(
              font_awesome_flutter.FontAwesomeIcons.barcode,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Barcode can\'t be empty' : null,
        onSaved: (value) => _barcode = value,
      ),
    );
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
        onPressed: _validateAndSubmit,
        /*() {
          _getDataFromAPI();
        },*/
      )),
    );
  }

  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      //_isLoading = true;
    });
    if (_validateAndSave()) {
      String barcode = "";
      try {
        _getDataFromAPI();
        /*setState(() {
        _isLoading = false;
      });*/

      } catch (e) {
        print('Error: $e');
        setState(() {
          //_isLoading = false;
          _errorMessage = e.message;
        });
      }
    }
  }

// Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget _showTextResult() {
    if (_OffObject != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: FutureBuilder<OffObject>(
            future: _OffObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
                    //ListView(shrinkWrap: true,
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: Wrap(children: <Widget>[
                            (snapshot.data.product != null &&
                                    snapshot.data.product.imageFrontSmallUrl !=
                                        null)
                                ? Image.network(
                                    snapshot.data.product.imageFrontSmallUrl)
                                : Image.asset('assets/not_found.png')
                          ])),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: new Wrap(children: <Widget>[
                            Text("Generic Name: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text((snapshot.data.product != null &&
                                    snapshot.data.product.productName != null)
                                ? snapshot.data.product.productName
                                : "No data found")
                          ])),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: new Wrap(children: <Widget>[
                            Text("Ingredients text: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text((snapshot.data.product != null &&
                                    snapshot.data.product.ingredientsText !=
                                        null)
                                ? snapshot.data.product.ingredientsText
                                : "No data found")
                          ])),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: new Wrap(children: <Widget>[
                            Text("Nutriments: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text((snapshot.data.product != null &&
                                    snapshot.data.product.nutriments != null)
                                ? snapshot.data.product.nutriments.toString()
                                : "No data found")
                          ])),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: new Wrap(children: <Widget>[
                            Text("Creator: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text((snapshot.data.product != null &&
                                    snapshot.data.product.creator != null)
                                ? snapshot.data.product.creator.toString()
                                : "No data found")
                          ]))
                    ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ));
    } else if (_textMessage != null && _textMessage.length > 0) {
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
      _textMessage = "genericName: " +
          model.product.genericName +
          "\n\n" +
          "ingredientsText: " +
          model.product.ingredientsText +
          "\n\n" +
          "nutriments: " +
          model.product.nutriments.toString();
      //_textMessage = offModel.product.nutriments.toString();
      _post = null;
      _OffObject = null;
    });
  }

  _getDataFromAPI() {
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
    //_barcode = '8412042502381'; // MORDARIZ 330 Ml
    //_barcode = '8411620001155'; // El Caserio
    //_barcode = '8413993070103'; // ensaladilla
    final url = _baseUrl + _barcode + _baseUrlEnd;
    print(url);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return OffObject.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Widget _showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Future _scanQR() async {
    try{
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        _textEditingController.text = qrResult;
        //_barcode = qrResult;
      });
    } on PlatformException catch(e) {
      if(e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _textEditingController.text = "Camera permission was denied";
        });
      } else {
        setState(() {
          _textEditingController.text = "Unknown error $e";
        });
      }
    } on FormatException {
      setState(() {
        _textEditingController.text = "You pressed the back button before scanning anything";
      });
    } catch(e) {
      setState(() {
        _textEditingController.text = "Unknown error $e";
      });
    }
  }

}

