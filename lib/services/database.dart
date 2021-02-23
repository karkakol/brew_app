import 'package:brew_crew/models/user_data_model.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  final AuthService authService;

  DatabaseService({this.authService});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(authService.userData.uid).set(
          Brew(
            name: name,
            sugars: sugars,
            strength: strength,
          ).toMap(),
        );
  }

  Future initializeUser() async {
    return await brewCollection.doc(authService.userData.uid).set(
          Brew(
            sugars: '0',
            name: '${authService.userData.email}',
            strength: 100,
          ).toMap(),
        );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map(
          (val) => Brew().fromMap(val.data()),
        )
        .toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData().fromMap(snapshot.data(), authService.userData.uid);
  }

  Stream<UserData> get userDataStream {
    return brewCollection
        .doc(authService.userData.uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
