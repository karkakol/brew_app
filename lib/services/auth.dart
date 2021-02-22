import 'package:brew_crew/user_id_model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User userData;

  Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      userData = result.user;
      return userFromFirebaseUser(userData);
    } catch (e) {
      throw Exception();
    }
  }

  Future registerWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      userData = result.user;

      return userFromFirebaseUser(userData);
    } catch (e) {
      throw Exception();
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      throw Exception();
    }
  }

  Stream<UserId> get user {
    return auth
        .authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user));
        .map(userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential userCredential = await auth.signInAnonymously();
      User user = userCredential.user;
      return userFromFirebaseUser(user);
    } catch (e) {
      throw Exception();
    }
  }

  UserId userFromFirebaseUser(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }
}
