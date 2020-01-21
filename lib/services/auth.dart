import 'package:coffe_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{


final FirebaseAuth _auth = FirebaseAuth.instance;

// create usr obj based on firebaseusr

User _userFromFirebaseUser(FirebaseUser user){
  return user != null? User(uid: user.uid): null;


}
//auth change user stream

Stream<User> get user {
  return _auth.onAuthStateChanged
  .map(_userFromFirebaseUser);
}


//sign anon
Future signInAnon() async {
try{
AuthResult authResult = await _auth.signInAnonymously();
FirebaseUser user = authResult.user;
return _userFromFirebaseUser(user);
}catch(e)
{
print(e.toString());
return null;
}


}


//sign in with email & password

// Register with email & password


//sign out

}