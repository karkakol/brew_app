import 'package:brew_crew/screens/authenticate/login/sign_in_model.dart';
import 'package:brew_crew/screens/authenticate/register/register_coordinator.dart';
import 'package:brew_crew/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constans.dart';
import 'package:brew_crew/shared/loading.dart';

class SignInScreen extends StatelessWidget {
  final SignInModel model;

  SignInScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return model.loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              //elevation: 0.0,
              title: Text('Sign in to Brew Crew'),
              actions: [
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('register'),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RegisterCoordinator(),
                      ),
                    );
                  },
                )
              ],
            ),
            backgroundColor: Colors.brown[100],
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: model.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: model.email,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter email' : null,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: model.password,
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) =>
                          val.length < 6 ? 'Enter a 6+ chars long pass' : null,
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0),
                    Button(onTap: model.login, text: 'login'),
                    Text(
                      model.error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
