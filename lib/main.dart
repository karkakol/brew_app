import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/user_id_model/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final injector = Injector.appInstance;

  injector.registerSingleton<AuthService>(() => AuthService());
  injector.registerSingleton<DatabaseService>(() => DatabaseService(
    authService: injector.get<AuthService>()
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthService authService;

  MyApp() {
    final injector = Injector.appInstance;
    authService = injector.get<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserId>.value(
      value: authService.user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
