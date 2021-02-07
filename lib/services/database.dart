import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final uid;
  DatabaseService({this. uid});

  //collection reference

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strenght) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strenght': strenght,
    });
  }

  // get brew stream

  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }

}