import 'package:coffe_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

final _formKey = GlobalKey<FormState>();
class _SignInState extends State<SignIn> {

final AuthService _auth = AuthService();

String email = '';
String password = '';
String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(backgroundColor: Colors.brown[400],
      elevation: 0.0,
      title: Text('Sign in to coffe app'),
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Register'),
          onPressed: (){
            widget.toggleView();
          },
          )
      ],
      ),
      body: Container(padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          SizedBox(height: 20.0),
          TextFormField(
            validator: (val)=>val.isEmpty?"enter your email":null,
            onChanged: (val){
              setState(()=>email = val);
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            validator: (val)=>val.isEmpty?"enter your password":null,
            obscureText: true,
            onChanged: (val){
              setState(()=>password = val);


            },
          ),
          SizedBox(height: 20.0),
          RaisedButton(onPressed: ()async{
            if(_formKey.currentState.validate()){
              dynamic result = await _auth.signInWithEmailAndPassword(email,password);
              if(result == null){
                setState(()=>error = ' authentication error');
              }
            } 
            else {


            }


          },
          color: Colors.pink[400],
          child: Text('sign in',
          style: TextStyle(color: Colors.white),
          ),
          )
        ],
        )
      ),
      
      ),
      
    );
  }
}