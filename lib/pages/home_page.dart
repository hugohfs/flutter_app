import 'package:hfs_flutter_app/globals/globals.dart' as globals;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hfs_flutter_app/components/Drawer.dart';
import 'package:hfs_flutter_app/pages/baby_name_votes.dart';
import 'package:hfs_flutter_app/pages/friendly_chat.dart';
import 'package:hfs_flutter_app/pages/open_food_facts.dart';
import 'package:hfs_flutter_app/pages/startup_name_generator.dart';
import 'package:hfs_flutter_app/pages/todo_page.dart';
import 'package:hfs_flutter_app/services/authentication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    as font_awesome_flutter;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isEmailVerified = false;

  int _selectedIndex = 1;
  /*final _widgetOptions = [
    Text('Index 0: Home'),
    Text('Index 1: Startup Name Generator'),
    Text('Index 2: Friendly Chat'),
    Text('Index 3: Baby Name Votes'),
    Text('Index 4: Todo List'),
    Text('Index 5: Open Food Facts'),
  ];*/

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 5, vsync: this);

    _checkEmailVerification();

    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          globals.userAccountEmail = user?.email;
        }
      });
    });
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _signOut() async {
    Navigator.of(context).pop();
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
      //appBar: new MyAppBar(
          title: _showTitle(_selectedIndex),
          actions: <Widget>[
            _showActionButtons(_selectedIndex),
          ]/*,
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.amber,
            tabs: [
              new Tab(icon: new Icon(Icons.favorite_border)),
              new Tab(icon: new Icon(Icons.call)),
              new Tab(icon: new Icon(Icons.chat)),
              new Tab(icon: new Icon(Icons.notifications))
            ],
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,),
            bottomOpacity: 1,*/
          ),
      drawer: new Drawer(child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(globals.userAccountEmail),
            accountEmail: Text(globals.userAccountEmail),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(globals.userAccountEmail.length > 0
                  ? globals.userAccountEmail[0].toUpperCase()
                  : ""),
            ),
          ),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: _signOut),
        ],
      ),),
        /*drawer: new Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(globals.userAccountEmail),
            accountEmail: Text(globals.userAccountEmail),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(globals.userAccountEmail.length > 0
                  ? globals.userAccountEmail[0].toUpperCase()
                  : ""),
            ),
          ),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
              onTap: _signOut),
        ],
      )),*/
      /*body: TabBarView(
        children: [
          OpenFoodFactsPage(),
          new Text("This is call Tab View"),
          new Text("This is chat Tab View"),
          new Text("This is notification Tab View"),
        ],
        controller: _tabController,
      ),*/
      body: Center(child: _showCurrentTab(_selectedIndex)
          //_widgetOptions.elementAt(_selectedIndex)
          ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'), backgroundColor: Theme.of(context).accentColor),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text('NameGenerator'), backgroundColor: Theme.of(context).accentColor),
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chat')),
            BottomNavigationBarItem(icon: Icon(Icons.child_care), title: Text('BabyName')),
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Todo')),
            BottomNavigationBarItem(icon: Icon(font_awesome_flutter.FontAwesomeIcons.barcode), title: Text('OpenFoodFacts')),
          ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      )
    );
  }

  Widget _showTitle(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return Text('Home');
        break;
      case 1:
        return Text('Startup Name Generator');
        break;
      case 2:
        return Text('Friendly Chat');
        break;
      case 3:
        return Text('Baby Name Votes');
        break;
      case 4:
        return Text('Todo List');
        break;
      case 5:
        return Text('Open Food Facts');
        break;
      default:
        return Text("Index tab not defined");
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/flutter-icon.png'),
        ),
      ),
    );
  }

  Widget _showCurrentTab(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return _showHome();
        break;
      case 1:
        return StartupNameGenerator();
        break;
      case 2:
        return ChatScreen(
          auth: widget.auth,
        );
        break;
      case 3:
        return BabyNameVotes();
        break;
      case 4:
        return TodoPage();
        break;
      case 5:
        return OpenFoodFactsPage();
        break;
      default:
        return Text("Index tab not defined");
        break;
    }
  }

  Widget _showActionButtons(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return IconButton(icon: Icon((Icons.exit_to_app)), onPressed: _signOut);
        break;
      case 1:
        return IconButton(icon: const Icon(Icons.list), onPressed: null);
        break;
      case 2:
        return IconButton(
          icon: const Icon(Icons.arrow_back),
        );
        break;
      case 3:
        return IconButton(
          icon: const Icon(Icons.arrow_back),
        );
        break;
      case 4:
        return IconButton(
          icon: const Icon(Icons.arrow_back),
        );
        break;
      case 5:
        return IconButton(
          icon: const Icon(Icons.arrow_back),
        );
        break;
      default:
        return Text("Index tab not defined");
        break;
    }
  }


    Container _showHome() {
      return Container(
        child: Column(children: <Widget>[
          _showLogo(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: Center(
              child: RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: Colors.blue,
                child: Text('Startup Name Generator',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StartupNameGenerator()),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new Center(
              child: RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.blue,
                child: Text('Friendly Chat',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          auth: widget.auth,
                        )),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Center(
              child: RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Center(
              child: RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Center(
              child: RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.blue,
                child: Text('OpenFoodFacts',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpenFoodFactsPage()),
                  );
                },
              ),
            ),
          ),
        ]),
      );
    }
  }
