import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BabyNameVotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BabyNameVotesPage();
  }
}

class BabyNameVotesPage extends StatefulWidget {
  @override
  _BabyNameVotesPageState createState() {
    return _BabyNameVotesPageState();
  }
}

class _BabyNameVotesPageState extends State<BabyNameVotesPage> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Baby Name Votes')),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialogAdd(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('baby')
          .orderBy('votes', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => Firestore.instance.runTransaction((transaction) async {
                final freshSnapshot = await transaction.get(record.reference);
                final fresh = Record.fromSnapshot(freshSnapshot);

                await transaction
                    .update(record.reference, {'votes': fresh.votes + 1});
              }),
          onLongPress: () {
            _showDialogDelete(context, record);
          },
        ),
      ),
    );
  }

  _showDialogDelete(BuildContext context, Record record) async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text('Do you want to delete the name?'),
                )
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    _deleteBabyName(record);
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  _showDialogAdd(BuildContext context) async {
    _textEditingController.clear();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'Add new baby name',
                  ),
                ))
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Add'),
                  onPressed: () {
                    _addNewBabyName(_textEditingController.text.toString());
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  _addNewBabyName(String babyName) {
    if (babyName.length > 0) {
      Map<String, dynamic> newRecord = {
        'name': babyName.toString(),
        'votes': 0,
      };

      CollectionReference dbBaby = Firestore.instance.collection('baby');

      Firestore.instance.runTransaction((Transaction tx) async {
        //TODO: check if already exists
        var _result = await dbBaby.add(newRecord);
        print(_result);
      });
    }
  }

  _deleteBabyName(Record record) {
    Firestore.instance.runTransaction((transaction) async {
      final freshSnapshot = await transaction.get(record.reference);
      final fresh = Record.fromSnapshot(freshSnapshot);

      await transaction.delete(fresh.reference);
    });
  }
}

class Record {
  final String name;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
