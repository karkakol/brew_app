import 'package:brew_crew/models/user_data_model.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  final AuthService authService;

  DatabaseService({this.authService});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strenght) async {
    return await brewCollection.doc(authService.userData.uid).set(
          Brew(name: name, sugars: sugars, strenght: strenght).toMap(),
        );
  }

  Future setUserData() async {
    return await brewCollection.doc(authService.userData.uid).set(
          Brew(
                  sugars: '0',
                  name: '${authService.userData.email}',
                  strenght: 100)
              .toMap(),
        );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map(
      (val) {
        return Brew().fromMap(val.data());
      },
    ).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: authService.userData.uid,
      name: snapshot.data()['name'],
      strenght: snapshot.data()['strenght'],
      sugars: snapshot.data()['sugars'],
    );
  }

  Stream<UserData> get userDataStream {
    //print(brewCollection.doc(authService.userData.uid).snapshots().map(_userDataFromSnapshot));
    return brewCollection
        .doc(authService.userData.uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
