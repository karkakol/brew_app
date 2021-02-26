import 'package:brew_crew/screens/home/home_page/home_model.dart';
import 'package:brew_crew/screens/home/home_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeCoordinator extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = useHomeModel();
    return HomeScreen(model: model);
  }
}
