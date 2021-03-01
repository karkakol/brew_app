import 'package:brew_crew/shared/constant.dart';
import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final TextEditingController controller;
  final String error;
  final bool isObscure;
  final String hintText;

  BasicTextField({
    this.controller,
    this.error,
    this.isObscure,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: textInputDecoration.copyWith(hintText: hintText),
            obscureText: isObscure,
          ),
          Text(
            error ?? '',
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
