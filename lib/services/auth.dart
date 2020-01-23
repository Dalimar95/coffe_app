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

// sign out annon
Future signOutAnon() async {
try{
return await _auth.signOut();
}catch(e){
print(e.toString());
return null;
}

} 


//sign in with email & password
Future signInWithEmailAndPassword(String email,String password)async{
try{
  AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
  FirebaseUser user = result.user;
  return _userFromFirebaseUser(user);

}catch(e){
print(e);
}
  
}


// Register with email & password
Future registerWithEmailAndPassword(String email, String password) async
{
try{
  AuthResult result = await _auth.createUserWithEmailAndPassword(email:email,password: password);
  FirebaseUser user = result.user;
  return _userFromFirebaseUser(user);

}catch(e){
  print(e.toString());
  return null;
}


}


//sign out

}