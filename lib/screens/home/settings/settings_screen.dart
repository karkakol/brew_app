import 'package:brew_crew/screens/home/settings/settings_model.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constans.dart';

class SettingsFormScreen extends StatelessWidget {
  final SettingsModel model;

  SettingsFormScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return !model.isReady
        ? Loading()
        : Form(
            key: model.formKey,
            child: Column(
              children: [
                Text(
                  'Update your brew settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: model.currentName,
                  decoration: textInputDecoration,
                  validator: (val) =>
                      val.isEmpty ? 'Please enter a name' : null,
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: model.currentSugars,
                  items: model.sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugar(s)'),
                    );
                  }).toList(),
                  onChanged: (val) => model.setSugars(val),
                ),
                Slider(
                  activeColor:
                      Colors.brown[model.currentStrenght],
                  inactiveColor:
                      Colors.brown[model.currentStrenght],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  onChanged: (val) => model.setStrenght(val.round()),
                  value: model.currentStrenght.toDouble(),
                ),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text('update', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    model.updateSettings();
                  },
                )
              ],
            ),
          );
  }
}
