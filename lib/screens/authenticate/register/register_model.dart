import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injector/injector.dart';

class RegisterModel {
  final Function register;
  final formKey;
  final bool loading;
  final TextEditingController email;
  final TextEditingController password;
  final String error;

  RegisterModel(
      {this.register,
      this.formKey,
      this.loading,
      this.email,
      this.password,
      this.error});
}

RegisterModel useRegisterModel() {
  final injector = Injector.appInstance;

  final _email = useTextEditingController();
  final _password = useTextEditingController();
  final _loading = useState<bool>(false);

  final _error = useState<String>('');
  final AuthService _auth = injector.get<AuthService>();
  final _formKey = GlobalKey<FormState>();

  return RegisterModel(
    register: () async {
      if (_formKey.currentState.validate()) {
        _loading.value = true;
        final result = await _auth.registerWithEmailAndPassword(
            _email.value.text, _password.value.text);
        if (result == null) {
          _error.value = 'your data is icorrect';
          _loading.value = false;
        } else {
          await injector.get<DatabaseService>().setUserData();
        }
      }
    },
    error: _error.value,
    password: _password,
    email: _email,
    formKey: _formKey,
    loading: _loading.value,
  );
}
