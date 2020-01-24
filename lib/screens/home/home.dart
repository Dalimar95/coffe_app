import 'package:coffe_app/models/user_data.dart';
import 'package:coffe_app/screens/home/settings_form.dart';
import 'package:coffe_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:coffe_app/screens/home/user_list.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel (){
      showModalBottomSheet(context: context,builder: (context){
        return Container(padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
        child: SettingFrom(),
        
        );
      });
    }

    return StreamProvider<List<UserData>>.value(
      value: DatabaseService().userData,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Coffe App'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[ FlatButton.icon(
              icon: Icon(Icons.settings),
              onPressed: ()=>_showSettingsPanel(),
              label: Text('settings'),
            ),
            FlatButton.icon(
              icon: Icon(Icons.person),
              onPressed: ()async{
                await _auth.signOutAnon();
              },
              label: Text('logout'),
            )
          ],

        ),
        body:  UserList(),
      ),
    );
  }
}