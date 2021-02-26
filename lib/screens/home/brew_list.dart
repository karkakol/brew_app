import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading_widget.dart';
import 'package:brew_crew/shared/prime_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injector/injector.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';

class BrewList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final injector = Injector.appInstance;
    final List<Brew> brews =
        useStream(useMemoized(() => injector.get<DatabaseService>().brews))
            ?.data
            ?.toList();
    return brews == null
        ? LoadingWidget()
        : ListView.builder(
            itemCount: brews.length,
            itemBuilder: (context, index) {
              return BrewTile(brew: brews[index]);
            },
          );
  }
}
