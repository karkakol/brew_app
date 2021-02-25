import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/user_id_model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home_page/home_coordinator.dart';

class AplicationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserId>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomeCoordinator();
    }
  }
}
