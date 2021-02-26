import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injector/injector.dart';

class RegisterModel {
  final Function register;
  final bool loading;
  final TextEditingController email;
  final TextEditingController password;
  final String emailError;
  final String error;
  final String passwordError;

  RegisterModel({
    this.register,
    this.loading,
    this.email,
    this.password,
    this.emailError,
    this.passwordError,
    this.error,
  });
}

RegisterModel useRegisterModel() {
  final injector = Injector.appInstance;
  final email = useTextEditingController();
  final password = useTextEditingController();
  final error = useState('');
  final emailError = useState('');
  final passwordError = useState('');
  final loading = useState<bool>(false);
  final AuthService _auth = injector.get<AuthService>();

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

  Future<void> register() async {
    if (validation()) {
      loading.value = true;
      final result = await _auth.registerWithEmailAndPassword(
          email.value.text, password.value.text);
      print(result);
      if (result == null) {
        error.value = "wrong data stupid mutherfucker";
        loading.value = false;
      } else {
        await injector.get<DatabaseService>().initializeUser();
      }
    }
  }

  return RegisterModel(
    register: register,
    passwordError: passwordError.value,
    emailError: emailError.value,
    password: password,
    email: email,
    loading: loading.value,
  );
}
