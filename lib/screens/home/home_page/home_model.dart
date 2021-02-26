import 'package:brew_crew/services/auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injector/injector.dart';

class HomeModel {
  final signOut;

  HomeModel({
    this.signOut,
  });
}

HomeModel useHomeModel() {
  final injector = Injector.appInstance;

  signOut() {
    useFuture(injector.get<AuthService>().signOut());
  }

  return HomeModel(
    signOut: signOut,
  );
}
