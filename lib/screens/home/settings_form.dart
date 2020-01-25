import 'package:coffe_app/models/user.dart';
import 'package:coffe_app/services/database.dart';
import 'package:coffe_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:coffe_app/shared/constants.dart';
import 'package:provider/provider.dart';



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

    final user =Provider.of<User>(context); 

    return StreamBuilder<UData>(
      stream: DatabaseService(uid: user.uid ).userDocument,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UData  uData = snapshot.data;
          // _currentName = uData.name;
          // _currentStrength = uData.strength;
          // _currentSugars = uData.sugars;
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
                  initialValue: uData.name,
                  decoration: textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val)=>val.isEmpty?"Please Enter Your Name":null,
                  onChanged: (val){
                    setState(()=> _currentName = val);
                  },
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(

                  decoration: textInputDecoration,
                  value: _currentSugars??uData.sugars,
                  items: sugars.map((sugar){
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'));
                  }).toList(),
                  onChanged: (val)=> setState(()=>_currentSugars = val),
                ),
                Slider(
                  value: (_currentStrength??uData.strength).toDouble(),
                  activeColor: Colors.brown[_currentStrength??uData.strength],
                  inactiveColor: Colors.brown[_currentStrength??uData.strength],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  onChanged: (val)=>setState(()=> _currentStrength = val.round()),
                  
                ),
                RaisedButton(
                  color: Colors.pink[400],
                  child:Text(
                    'Update',
                    style: TextStyle(color:Colors.white),
                  ),
                  onPressed: ()async{
                    if(_formKey.currentState.validate()){
                    await DatabaseService(uid: user.uid).updateUserData(_currentSugars??uData.sugars, _currentName??uData.name, _currentStrength??uData.strength);                  
                    Navigator.pop(context);                    
                    }
                  },
                  )
              ],
            ),
            
        );
        }else {
            return Loading();
        }
        
      }
    );
  }
}