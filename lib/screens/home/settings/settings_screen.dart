import 'package:brew_crew/screens/home/settings/settings_model.dart';
import 'package:brew_crew/shared/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class SettingsFormScreen extends StatelessWidget {
  final SettingsModel model;
  final focuseNode = FocusNode();

  SettingsFormScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return !model.isReady
        ? LoadingWidget()
        : Form(
            key: model.formKey,
            child: Column(
              children: [
                _text(),
                _textFormField(),
                _dropdownButtonFormField(),
                _slider(),
                _raisedButton(context),
              ],
            ),
          );
  }

  _text<widget>() {
    return Text(
      'Update your brew settings.',
      style: TextStyle(fontSize: 18.0),
    );
  }

  _textFormField<Widget>() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextFormField(
        controller: model.currentName,
        decoration: textInputDecoration,
        validator: (val) => val.isEmpty ? 'Please enter a name' : null,
      ),
    );
  }

  _dropdownButtonFormField<Widget>() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: DropdownButtonFormField(
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
    );
  }

  _slider<Widget>() {
    return Slider(
      activeColor: Colors.brown[model.currentstrength],
      inactiveColor: Colors.brown[model.currentstrength],
      min: 100,
      max: 900,
      divisions: 8,
      onChanged: (val) => model.setstrength(val.round()),
      value: model.currentstrength.toDouble(),
    );
  }

  _raisedButton<Widget>(BuildContext context) {
    return RaisedButton(
      color: Colors.pink[400],
      child: Text('update', style: TextStyle(color: Colors.white)),
      onPressed: () async {
        model.updateSettings(context);
      },
    );
  }
}
