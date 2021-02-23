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

  RegisterModel({
    this.register,
    this.formKey,
    this.loading,
    this.email,
    this.password,
    this.error,
  });
}

RegisterModel useRegisterModel() {
  final injector = Injector.appInstance;

  final email = useTextEditingController();
  final password = useTextEditingController();
  final loading = useState<bool>(false);

  final error = useState<String>('');
  final AuthService _auth = injector.get<AuthService>();
  final formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (formKey.currentState.validate()) {
      loading.value = true;
      final result = await _auth.registerWithEmailAndPassword(
          email.value.text, password.value.text);
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
    error: error.value,
    password: password,
    email: email,
    formKey: formKey,
    loading: loading.value,
  );
}
