import 'package:brew_crew/user_id_model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User _userData;

  get userData => _userData;

  Future<UserId> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    _userData = result.user;
    return userFromFirebaseUser(_userData);
  }

  Future<UserId> registerWithEmailAndPassword(
      String email, String password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    _userData = result.user;
    return userFromFirebaseUser(_userData);
  }

  Future<void> signOut() async {
    return await auth.signOut();
  }

  Stream<UserId> get userId {
    return auth.authStateChanges().map(userFromFirebaseUser);
  }

  UserId userFromFirebaseUser(User user) {
    return user != null ? UserId(uid: user.uid) : null;
  }
}
