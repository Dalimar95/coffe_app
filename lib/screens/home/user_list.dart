import 'package:coffe_app/screens/home/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/models/user_data.dart';
import 'package:provider/provider.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<UserData>>(context);
   // print (users.documents);

   users.forEach((user){
     print(user.name);
     print(user.sugars);
     print(user.strength);
   });

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
        return UserTile(user: users[index]);
      },
      
    );
  }
}