import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  final Function onTap;
  final String text;

  LoginRegisterButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton(
        onPressed: () => onTap(),
        color: Colors.pink[400],
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
