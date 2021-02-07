import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase User

  TheUser _userFromFirebaseUser(User user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<TheUser> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon

  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('error: ${e.toString()}');
      return null;
    }
  }

// sign in with email & password
  Future signInWithEmailAndPassword(String email, String pass) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user  = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
// register with email & password
  Future registerWithEmailAndPassword(String email, String pass) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User user  = result.user;

      //create a nwe document for the uset with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'new member', 100);

      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


// sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
