import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injector/injector.dart';

class HomeModel {
  final Function signOut;
  Stream<List<Brew>> brews;

  HomeModel({
    this.signOut,
    this.brews,
  });
}

HomeModel useHomeModel() {
  final injector = Injector.appInstance;
  Stream<List<Brew>> brews = injector.get<DatabaseService>().brews;

  signOut() async {
    injector.get<AuthService>().signOut();
  }

  return HomeModel(
    brews: brews,
    signOut: signOut,
  );
}
