import 'package:clinic_app/domain/user.dart' as MyUser;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> signInWithEmailAndPassword(
      String email, String password) async {
    print(email);
    print(password);
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOutWithEmailAndPassword() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Stream getCurrentUser() {
    return _auth.authStateChanges();
  }
}
