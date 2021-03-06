import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Sesion iniciada.";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Registro realizado";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
