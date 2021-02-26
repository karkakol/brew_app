import 'package:brew_crew/shared/constant.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String passwordError;

  PasswordField({
    this.controller,
    this.passwordError,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: textInputDecoration.copyWith(hintText: 'Password'),
            obscureText: true,
          ),
          Text(
            passwordError ?? '',
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
