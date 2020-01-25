import 'package:flutter/material.dart';
import 'package:coffe_app/models/user_data.dart';


class UserTile extends StatelessWidget {
  
  final UserData user;
  UserTile({this.user});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[user.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            radius: 25.0
          ),
          title: Text(user.name),
          subtitle: Text('Takes${user.sugars} sugar(s)'),
        ),
      ),
    );

  }
}