import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constans.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  String _currentName;
  String _currentSugars;
  int _currentStrenght;



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(()=>_currentName = val),
          ),
          SizedBox(height: 20.0),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value:_currentSugars ?? '0',
              items: sugars.map((sugar){
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugar(s)'),
                );
              }).toList(),
            onChanged: (val) => setState(()=>_currentSugars = val),
          ),

          Slider(
            activeColor: Colors.brown[_currentStrenght ?? 100],
            inactiveColor: Colors.brown[_currentStrenght ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(()=> _currentStrenght = val.round()),
            value: (_currentStrenght ?? 100).toDouble(),
          ),

          //slider
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'update',
              style: TextStyle(color: Colors.white)
            ),
            onPressed: () async {
            },
          )
        ],
      ),

    );
  }
}
