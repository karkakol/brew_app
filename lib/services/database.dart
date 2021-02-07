import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';

class DatabaseService {
  final uid;

  DatabaseService({this.uid});

  //collection reference

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strenght) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strenght': strenght,
    });
  }

  // get brew stream

  Stream<List<Brew>> get brews {
    print(brewCollection.snapshots().toString());
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((val) {
      return Brew(
          name: val.data()['name'] ?? '',
          strenght: val.data()['strenght'] ?? 0,
          sugars: val.data()['sugars'] ?? '0');
    }).toList();
  }

  // userData from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      strenght: snapshot.data()['strenght'],
      sugars: snapshot.data()['sugars'],
    );
  }

  Stream<UserData> get userData{
    return brewCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}
