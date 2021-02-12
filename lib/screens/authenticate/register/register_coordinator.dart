import 'package:brew_crew/screens/authenticate/register/register_screen.dart';
import 'package:brew_crew/screens/authenticate/register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterCoordinator extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = useRegisterModel();
    return RegisterScreen(model: model);
  }
}
