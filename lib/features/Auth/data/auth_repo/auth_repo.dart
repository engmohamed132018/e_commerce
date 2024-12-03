import 'package:e_commerce/features/Auth/data/auth_database/auth_firebase_consumer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final AuthFireBaseConsumer auth;

  AuthRepo({required this.auth});

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }
}
