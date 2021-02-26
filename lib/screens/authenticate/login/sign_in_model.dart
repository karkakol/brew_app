import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injector/injector.dart';

class SignInModel {
  final Function login;
  final bool loading;
  final TextEditingController email;
  final TextEditingController password;
  final String emailError;
  final String error;
  final String passwordError;

  SignInModel({
    this.login,
    this.loading,
    this.email,
    this.password,
    this.emailError,
    this.passwordError,
    this.error,
  });
}

SignInModel useSignInModel() {
  final injector = Injector.appInstance;
  final email = useTextEditingController();
  final password = useTextEditingController();
  final error = useState('');
  final emailError = useState('');
  final passwordError = useState('');
  final loading = useState<bool>(false);
  final AuthService auth = injector.get<AuthService>();

  bool validation() {
    bool isOk = true;
    if (password.text.length < 6) {
      passwordError.value = "password is too short bitch";
      isOk = false;
    }
    if (!email.text.contains(new RegExp(r'[@.]'))) {
      emailError.value = "wrong syntax in mail";
      isOk = false;
    }
    return isOk;
  }

  Future<void> login() async {
    if (validation()) {
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
    emailError: emailError.value,
    passwordError: passwordError.value,
    loading: loading.value,
  );
}
