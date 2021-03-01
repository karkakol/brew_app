import 'package:brew_crew/screens/authenticate/register/register_coordinator.dart';
import 'package:flutter/material.dart';
import 'login/sign_in_coordinator.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'some text',
      initialRoute: '/register',
      routes: {
        '/': (context) => SignInCoordinator(),
        '/register': (context) => RegisterCoordinator()
      },
    );
  }
}
