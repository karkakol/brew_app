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

  SignInModel({
    this.login,
    this.formKey,
    this.loading,
    this.email,
    this.password,
    this.error,
  });
}

SignInModel useSignInModel() {
  final injector = Injector.appInstance;

  final email = useTextEditingController();
  final password = useTextEditingController();
  final loading = useState<bool>(false);
  final error = useState<String>('');

  final AuthService auth = injector.get<AuthService>();

  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState.validate()) {
      loading.value = true;
      final result = await auth.signInWithEmailAndPassword(
        email.value.text,
        password.value.text,
      );
      if (result == null) {
        error.value = 'wrong data';
        loading.value = false;
      }
    }
  }

  return SignInModel(
    login: login,
    error: error.value,
    password: password,
    email: email,
    formKey: formKey,
    loading: loading.value,
  );
}
