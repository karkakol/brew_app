import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:injector/injector.dart';

class HomeModel {
  final Function signOut;
  final Stream<List<Brew>> brews;

  HomeModel({
    this.signOut,
    this.brews,
  });
}

HomeModel useHomeModel() {
  final injector = Injector.appInstance;
  final Stream<List<Brew>> brews = injector.get<DatabaseService>().brews;
  Future<void> signOut() async {
    injector.get<AuthService>().signOut();
  }
  return HomeModel(
    brews: brews,
    signOut: signOut,
  );
}
