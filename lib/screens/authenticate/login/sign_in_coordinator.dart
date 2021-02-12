import 'package:brew_crew/screens/authenticate/login/sign_in_screen.dart';
import 'package:brew_crew/screens/authenticate/login/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignInCoordinator extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = useSignInModel();
    return SignInScreen(model: model);
  }
}
