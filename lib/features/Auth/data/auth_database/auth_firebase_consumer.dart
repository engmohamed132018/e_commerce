import 'package:e_commerce/features/Auth/data/auth_database/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auht_database_consumer.dart';

class AuthFireBaseConsumer extends AuthDBConsumer {
  final _auth = FirebaseAuth.instance;
  @override
  Future<dynamic> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return response;
    } on FirebaseAuthException catch (e) {
      handleException(e);
    }
  }

  @override
  Future<void> sendPasswordResetEmail(
      {required String email, dynamic actionCodeSettings}) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final respons = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return respons;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
