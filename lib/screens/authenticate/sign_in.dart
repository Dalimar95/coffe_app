import 'package:coffe_app/services/auth.dart';
import 'package:coffe_app/shared/constants.dart';
import 'package:coffe_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

final _formKey = GlobalKey<FormState>();
final AuthService _auth = AuthService();
bool loading = false;

String email = '';
String password = '';
String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
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
            decoration: textInputDecoration.copyWith(hintText: 'Email'),
            validator: (val)=>val.isEmpty?"enter your email":null,
            onChanged: (val){
              setState(()=>email = val);
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Password'),
            validator: (val)=>val.isEmpty?"enter your password":null,
            obscureText: true,
            onChanged: (val){
              setState(()=>password = val);


            },
          ),
          SizedBox(height: 20.0),
          RaisedButton(onPressed: ()async{
            if(_formKey.currentState.validate()){
              setState(() => loading = true);
              dynamic result = await _auth.signInWithEmailAndPassword(email,password);
              
              if(result == null){
                setState(() {
                  error = ' authentication error';
                  loading = false;
                });
                
              }
            } 
            else {


            }


          },
          color: Colors.pink[400],
          child: Text('Sign in',
          style: TextStyle(color: Colors.white),
          ),
          ),
          SizedBox(height: 12.0),
          Text(error,
          style: TextStyle(color:Colors.red, fontSize: 14.0))
        ],
        )
      ),
      
      ),
      
    );
  }
}