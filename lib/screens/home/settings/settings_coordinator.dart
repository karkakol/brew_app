import 'package:brew_crew/screens/home/settings/settings_model.dart';
import 'package:brew_crew/screens/home/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsCoordinator extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = useSetSettings(context);
    return SettingsFormScreen(model: model);
  }
}
