import 'package:flutter/material.dart';
import 'package:coffe_app/shared/constants.dart';



class SettingFrom extends StatefulWidget {
  @override
  _SettingFromState createState() => _SettingFromState();
}

class _SettingFromState extends State<SettingFrom> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  //form values

  String _currentName;
  String _currentSugars;
  int _currentStrength;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your user settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            validator: (val)=>val.isEmpty?"Please Enter Your Name":null,
            onChanged: (val){
              setState(()=> _currentName = val);
            },
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars??'0',
            items: sugars.map((sugar){
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'));
            }).toList(),
            onChanged: (val)=> setState(()=>_currentSugars = val),
          ),
          RaisedButton(
            color: Colors.pink[400],
            child:Text(
              'Update',
              style: TextStyle(color:Colors.white),
            ),
            onPressed: ()async{
              print(_currentName);
              print(_currentStrength);
              print(_currentSugars);
            },
            )
        ],
      ),
      
    );
  }
}