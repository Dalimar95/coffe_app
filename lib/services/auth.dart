import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

final FirebaseAuth _auth = FirebaseAuth.instance;
//sign anon
Future signInAnon() async {
try{
AuthResult authResult = await _auth.signInAnonymously();
FirebaseUser user = authResult.user;
return user.uid;
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