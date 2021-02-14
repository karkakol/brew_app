import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsModel {
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String currentName;
  String currentSugars;
  int currentStrenght;
  final formKey;

  SettingsModel(
      {this.currentName,
      this.currentSugars,
      this.currentStrenght,
      this.formKey});
}

SettingsModel useSetSettings(BuildContext context) {

  final injector = Injector.appInstance;
  final DatabaseService _database = injector.get<DatabaseService>();

  final _currentName = useState<String>('');
  final _currentSugars = useState<String>('');
  final _currentStrenght = useState<int>(100);
  final _formKey = GlobalKey<FormState>();
}
