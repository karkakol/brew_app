import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injector/injector.dart';

class SignInModel {
  final Function login;
  final formKey;
  final bool loading;
  final TextEditingController email;
  final TextEditingController password;
  final String error;

  SignInModel(
      {this.login,
      this.formKey,
      this.loading,
      this.email,
      this.password,
      this.error});
}

SignInModel useSignInModel() {
  final injector = Injector.appInstance;


  final _email = useTextEditingController();
  final _password = useTextEditingController();
  final _loading = useState<bool>(false);
  final _error = useState<String>('');


  final AuthService _auth = injector.get<AuthService>();

  final _formKey = GlobalKey<FormState>();

  return SignInModel(
    login: () async {
      if (_formKey.currentState.validate()) {
        final result = await _auth.signInWithEmailAndPassword(
            _email.value.text, _password.value.text);
        if (result == null) {
          _error.value = 'your data is icorrect';
          _loading.value = false;
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
