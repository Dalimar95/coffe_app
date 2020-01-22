import 'package:coffe_app/screens/authenticate/authenticate.dart';
import 'package:coffe_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Coffe App'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            onPressed: ()async{
              await _auth.signOutAnon();
            },
            label: Text('logout'),
          )
        ],
      ),
      
    );
  }
}