import 'package:coffe_app/services/auth.dart';
import 'package:coffe_app/shared/constants.dart';
import 'package:coffe_app/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  Register({this.toggleView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading = false;

String email = '';
String password = '';
String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(backgroundColor: Colors.brown[400],
      elevation: 0.0,
      title: Text('Sign up in to coffe app'),
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Sign in'),
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
            validator: (val)=>val.isEmpty?"enter an email":null,
            onChanged: (val){
              setState(()=>email = val);
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Password'),        
            validator: (val)=>val.length<6?"password should contain atleast 6 characters":null,
            obscureText: true,
            onChanged: (val){
              setState(()=>password = val);


            },
          ),
          SizedBox(height: 20.0),
          RaisedButton(onPressed: ()async{
            if(_formKey.currentState.validate()){
              setState(() {
                loading = true;
              });
              dynamic result = await _auth.registerWithEmailAndPassword(email,password);
              if(result == null){
                setState(() {
                  error = ' Error with regist';
                  loading = false;
                });
                
              }
            } 
            else {


            }

          },
          color: Colors.pink[400],
          child: Text('Register',
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