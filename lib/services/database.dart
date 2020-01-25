import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_app/models/user.dart';
import 'package:coffe_app/models/user_data.dart';
import 'package:flutter/foundation.dart';

class DatabaseService{
final String uid;
DatabaseService({this.uid});
// collection reference 
final CollectionReference userCollection = Firestore.instance.collection('userData');

Future updateUserData(String sugars, String name, int strength) async
{
  return await userCollection.document(uid).setData({
    'sugars': sugars,
    'name':name,
    'strength': strength,


  }); 

}
//user data list from snapshop
List<UserData> _userDataFromSnapshot(QuerySnapshot snapshot){
  return snapshot.documents.map((doc){
    return UserData(
      name: doc.data['name']?? '',
      strength: doc.data['strength']??'',
      sugars: doc.data['sugars']?? '0',
    );
  }).toList();
}

//get userdata from snapshot
UData _uDataFromSnapshot(DocumentSnapshot snapshot){

  return UData(uid:uid,
    name: snapshot.data['name'],
    sugars: snapshot.data['sugars'],
    strength: snapshot.data['strength'],
  );
}

Stream<List<UserData>> get userData{
  return userCollection.snapshots().map(_userDataFromSnapshot);
}

//get user DocumentationIcon
Stream<UData> get userDocument{
  return userCollection.document(uid).snapshots().map(_uDataFromSnapshot);
}

}