import 'package:brew_crew/shared/constant.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  PasswordField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
      child: TextFormField(
        controller: controller  ,
        decoration: textInputDecoration.copyWith(hintText: 'Password'),
        validator: (val) => val.length < 6
            ? 'Password must be minimum 6 chars long'
            : null,
        obscureText: true,
      ),
    );
  }
}
