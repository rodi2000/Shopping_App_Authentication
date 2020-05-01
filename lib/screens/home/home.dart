import 'package:flutter/material.dart';
import 'package:printshoppy/screens/authenticate/wrapper.dart';
import 'package:printshoppy/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Log out'),
            onPressed: () async {
              await _auth.logout();
              Wrapper();
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text('This Part of App is Under Construction', textDirection: TextDirection.ltr, style: TextStyle(fontSize: 20.0)),
        )
      )
    );
  }
}
