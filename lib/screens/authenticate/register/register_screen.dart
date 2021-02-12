import 'package:brew_crew/screens/authenticate/login/sign_in_coordinator.dart';
import 'package:brew_crew/screens/authenticate/register/register_model.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constans.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterModel model;

  RegisterScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return model.loading
        ? Loading()
        : Scaffold(
            appBar: _buildAppBar(context),
            backgroundColor: Colors.brown[100],
            body: _buildBody(context),
          );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown[400],
      elevation: 0.0,
      title: Text('Register in to Brew Crew'),
      actions: [
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('sign in'),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SignInCoordinator()));
          },
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Form(
        key: model.formKey,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            TextFormField(
              controller: model.email,
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (val) => val.isEmpty ? 'Enter email' : null,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: model.password,
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              validator: (val) => val.length < 6 ? 'Pass is to short' : null,
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {
                model.register();
              },
              color: Colors.pink[400],
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              model.error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
