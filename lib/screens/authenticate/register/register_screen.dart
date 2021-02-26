import 'package:brew_crew/screens/authenticate/login/sign_in_coordinator.dart';
import 'package:brew_crew/screens/authenticate/register/register_model.dart';
import 'package:brew_crew/screens/navigator/slide_left_route.dart';
import 'package:brew_crew/shared/email_field.dart';
import 'package:brew_crew/shared/loading_widget.dart';
import 'package:brew_crew/shared/prime_button.dart';
import 'package:brew_crew/shared/password_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterModel model;

  RegisterScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return model.loading
        ? LoadingWidget()
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
              SlideLeftRoute(page: SignInCoordinator()),
            );
          },
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      child: Form(
        child: Column(
          children: [
            EmailField(controller: model.email, emailError: model.emailError),
            PasswordField(
                controller: model.password, passwordError: model.passwordError),
            PrimeButton(onTap: model.register, text: 'register'),
            Text(
              model.error ?? '',
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
