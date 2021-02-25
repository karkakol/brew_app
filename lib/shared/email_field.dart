import 'package:brew_crew/shared/constant.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  EmailField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,20.0,0,0),
      child: TextFormField(
        controller: controller  ,
        decoration: textInputDecoration.copyWith(hintText: 'Email'),
        validator: (val) => val.isEmpty ? 'Enter email' : null,
      ),
    );
  }
}
