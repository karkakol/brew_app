import 'package:brew_crew/models/user_data_model.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsModel {
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final TextEditingController currentName;
  final String currentSugars;
  final int currentStrenght;
  final Function updateSettings;
  final formKey;
  final bool isReady;
  final Function setSugars;
  final Function setStrenght;

  SettingsModel({
    this.currentName,
    this.currentSugars,
    this.currentStrenght,
    this.formKey,
    this.updateSettings,
    this.isReady,
    this.setStrenght,
    this.setSugars,
  });
}

SettingsModel useSetSettings(BuildContext context) {
  final injector = Injector.appInstance;
  final DatabaseService _database = injector.get<DatabaseService>();
  TextEditingController _currentName = useTextEditingController();
  final _isReady = useState<bool>(false);
  final _formKey = GlobalKey<FormState>();
  final AsyncSnapshot<UserData> snapshot =
      useStream(useMemoized(() => _database.userDataStream));
  final _currentSugars = useState();
  final _currentStrenght = useState();

  if (snapshot.hasData == false) {
    return SettingsModel(isReady: false);
  }

  final userData = snapshot?.data;

  useEffect(() {
    _currentSugars.value = userData.sugars;
    _currentStrenght.value = userData.strenght;
    return null;
  }, [userData]);

  _isReady.value = true;
  return SettingsModel(
    updateSettings: (BuildContext context) async {
      if (_formKey.currentState.validate()) {
        await injector.get<DatabaseService>().updateUserData(
              _currentSugars.value,
              _currentName.text,
              _currentStrenght.value,
            );
        Navigator.pop(context);
      }
    },
    currentName: _currentName,
    currentStrenght: _currentStrenght.value,
    currentSugars: _currentSugars.value,
    isReady: _isReady.value,
    formKey: _formKey,
    setStrenght: (val) {
      _currentStrenght.value = val;
    },
    setSugars: (val) {
      _currentSugars.value = val;
    },
  );
}
