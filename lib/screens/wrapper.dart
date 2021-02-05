import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/authenticate/authentic.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<TheUser>(context);

    // return either Home or Auntenticate widget
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
