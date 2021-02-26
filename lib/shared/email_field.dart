import 'package:brew_crew/shared/constant.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String emailError;

  EmailField({
    this.controller,
    this.emailError,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: textInputDecoration.copyWith(hintText: 'Email'),
          ),
          Text(
            emailError ?? '',
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
