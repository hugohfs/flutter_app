import 'package:hfs_flutter_app/globals/globals.dart' as globals;
import 'package:flutter/material.dart';

class MyDrawer extends Drawer {
  MyDrawer({Key key, Widget child}) : super(key: key, child: child);

  @override
  Widget build(BuildContext context) {
    return Drawer();
      /*child: ListView(children: <Widget>[
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
          title: Text("Closedddd"),
          trailing: Icon(Icons.close),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
            title: Text("Logouttttt"),
            trailing: Icon(Icons.exit_to_app),
            onTap: null)
      ]),
    );*/
  }
}
